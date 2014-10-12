# Stream

This is a rudimentary Julia implementation of a pipeline functionality in the vein of Elixir's `|>` operator in the form of a `@stream` macro. The significant difference between this and Julia's existing `|>` operator is that it accepts partially applied functions as parameters, passing the result of prior expressions as the first parameter of the latter function applications.

Combined with the [`Iterators`][itr] package, this enables an interface reminiscent of C#'s `IEnumerable` or Java's `Stream`. 

```julia
importall Stream, Iterators

# Adjust imap to expect the iterator rather than the function first.
imap(xs, f::Function) = imap(f, xs)

for (x,y) in @stream count(1, 3) take(20) imap(elem -> elem^2) enumerate
    println("Count: $(x), Value: $(y)")
end
```

[itr]: https://github.com/JuliaLang/Iterators.jl
