module Stream
export @stream

macro stream(ex, stream...)
  prior_ex = ex
  for elem in stream
    if isa(elem, Symbol)
      prior_ex = Expr(:call, elem, prior_ex)

    elseif isa(elem, Expr) && elem.head == :call
      insert!(elem.args, 2, prior_ex)
      prior_ex = elem

    else
      throw(ArgumentError("Stream element $(elem) is neither Symbol nor function call."))
    end
  end
  return esc(prior_ex)
end
end
