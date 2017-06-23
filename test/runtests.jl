using PrettyNumber
using Base.Test

# Check test validity
import PrettyNumber.max_int_len

@assert (max_int_len) == (5) "
This test is prepared for other default constants.
"

import PrettyNumber.pretty

@testset "Integers" begin
    @test pretty(1)      == "1"
    @test pretty(-11111) == "-11111"
    @test pretty(-1e4)   == "-10000"
    @test pretty(+1e6)   == "1⋅10⁶"
    @test pretty(-1e6)   == "-1⋅10⁶"
    @test pretty(-5e+60) == "-5⋅10⁶⁰"
end

@testset "Floating point" begin
    @test pretty(3e-4)                == "3⋅10⁻⁴"
    @test pretty(1.289e2)             == "128.9"
    @test pretty(1.22e1)              == "12.2"
    @test pretty(0.22e1)              == "2.2"
    @test pretty(1.12345678)          == "1.123"
    @test pretty(198.12345678)        == "198.123"
    @test pretty(1988.12345678)       == "1.988⋅10³"
    @test pretty(0.00000198812345678) == "1.988⋅10⁻⁶"
end

@testset "General macro" begin
    @test "1"                       |> prettify == "1"
    @test "01"                      |> prettify == "1"
    @test "010"                     |> prettify == "10"
    @test "100000000"               |> prettify == "1⋅10⁸"
    @test "1e20"                    |> prettify == "1⋅10²⁰"
    @test "1e2"                     |> prettify == "100"
    @test "+1"                      |> prettify == "1"
    @test "+01"                     |> prettify == "1"
    @test "+010"                    |> prettify == "10"
    @test "+100000000"              |> prettify == "1⋅10⁸"
    @test "+1e20"                   |> prettify == "1⋅10²⁰"
    @test "+1e+2"                   |> prettify == "100"
    @test "-1"                      |> prettify == "-1"
    @test "-01"                     |> prettify == "-1"
    @test "-010"                    |> prettify == "-10"
    @test "-100000000"              |> prettify == "-1⋅10⁸"
    @test "-1e20"                   |> prettify == "-1⋅10²⁰"
    @test "-1e-2"                   |> prettify == "-0.01"
    @test "+1.42"                   |> prettify == "1.42"
    @test "-01.42"                  |> prettify == "-1.42"
    @test "+010.42"                 |> prettify == "10.42"
    @test "-100000.42"              |> prettify == "-1.000⋅10⁵"
    @test "2.42e-20"                |> prettify == "2.42⋅10⁻²⁰"
    @test "-0.000000242"            |> prettify == "-2.42⋅10⁻⁷"
    @test "+0.000000242"            |> prettify == "2.42⋅10⁻⁷"
end

@testset "Unicode expresions" begin
    @test "ρ ≃ 0.4 ± 2e-5"         |> prettify == "ρ ≃ 0.4 ± 2⋅10⁻⁵"
    @test "ρ ≃ 00.04 ± 2e-3"       |> prettify == "ρ ≃ 0.04 ± 0.002"
    @test "γ=4.05e-20, β=5e-3"     |> prettify == "γ=4.05⋅10⁻²⁰, β=0.005"
    @test "∫σ dx = 0.00004"        |> prettify == "∫σ dx = 4⋅10⁻⁵"
    @test "0.42924042 ± 0.420e-20" |> prettify == "0.429 ± 4.2⋅10⁻²¹"
end

@testset "Escaping sequences" begin
    num = Float64(π)
    @test prettify("$num") == "3.142"
end

print_with_color(:green,"All test passed ✓\n")
