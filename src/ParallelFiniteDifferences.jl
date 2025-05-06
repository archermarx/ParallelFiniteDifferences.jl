module ParallelFiniteDifferences

using TestItems

function _get_step_size(x, rel)
    return rel * (1 + abs(x))
end

function eval_with_gradient!(g::Vector{T}, f, x::Vector{T})::Tuple{T, Vector{T}} where {T <: Real}
    # Check that vectors have correct shape
    @assert(length(x) == length(g), "Evaluation point and gradient vector must have the same length")

    relative_step_size = sqrt(eps(T))
    f0 = zero(T)

    Threads.@threads for i in 1:(length(g) + 1)
        if i == length(g) + 1
            # Compute the function value at the current point
            f0 = f(x)
        else
            # Compute function values at perturbed points
            old_x = x[i]
            step = _get_step_size(x[i], relative_step_size)
            x[i] += step
            g[i] = f(x)
            x[i] = old_x
        end
    end

    # Compute the gradient
    for i in eachindex(g)
        step = _get_step_size(x[i], relative_step_size)
        g[i] = (g[i] - f0) / step
    end

    return f0, g
end

@inline function gradient!(g::Vector{T}, f, x::Vector{T})::Vector{T} where {T <: Real}
    _, g = eval_with_gradient!(g, f, x)
    return g
end

@inline function eval_with_gradient(f, x::Vector{T})::Tuple{T, Vector{T}} where {T <: Real}
    return eval_with_gradient!(zeros(T, length(x)), f, x)
end

@inline function gradient(f, x::Vector{T})::Vector{T} where {T <: Real}
    return gradient!(zeros(T, length(x)), f, x)
end

@testitem "Tests" begin
    function rosenbrock_gradient(x)
        return [
            2 * (x[1] - 1) - 4 * 100 * (x[2] - x[1]^2) * x[1],
            2 * 100 * (x[2] - x[1]^2),
        ]
    end

    rosenbrock(x) = (1 - x[1])^2 + 100 * (x[2] - x[1]^2)^2

    for _ in 1:100
        x = rand(2)
        x_old = copy(x)
        f, g = ParallelFiniteDifferences.eval_with_gradient(rosenbrock, x)
        expected_g = rosenbrock_gradient(x)
        @test isapprox(g, expected_g, rtol = 1.0e-4)
        @test isapprox(f, rosenbrock(x))
        @test x == x_old
    end
end

end
