# PrettyNumber

[![Build Status](https://travis-ci.org/RedPointyJackson/PrettyNumber.jl.svg?branch=master)](https://travis-ci.org/RedPointyJackson/PrettyNumber.jl)

Let Julia decide how to print your numbers. No
more boilerplate or ugly dumps!

Before:

```julia
julia> val1 = 8595.0
julia> val2 = 1.0e-5
julia> println("ρ = $val1 ± $val2")
ρ = 8595.0 ± 1.0e-5
```

Awful! Now:

```julia
julia> using PrettyNumber
julia> val1 = 8595.0
julia> val2 = 1.0e-5
julia> prettyprint("ρ = $val1 ± $val2")
ρ = 8595 ± 1⋅10⁻⁵
```

Gorgeous! Check the `test` directory to see more
examples.

Provided functions:
* `prettify(str)`
  Return a nicer version of the string `str`.
* `prettyprint(str)`
  Just `println(prettify(str))`.
