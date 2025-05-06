# ParallelFiniteDifferences.jl

[![CI](https://github.com/archermarx/ParallelFiniteDifferences.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/archermarx/ParallelFiniteDifferences.jl/actions/workflows/CI.yml)
[![Coverage](https://codecov.io/gh/archermarx/ParallelFiniteDifferences.jl/graph/badge.svg?token=kmed5TM7cm)](https://codecov.io/gh/archermarx/ParallelFiniteDifferences.jl)


Simple package for computing finite differences in parallel for relatively expensive black-box functions.
Currently only supports multithreading and forward differences.
For best performance, make sure to start julia with a number of threads at least one greater than the dimension of the problem (i.e. for a four dimensional problem use at least 5 threads).
This package is quite basic at the moment, and you should probably just use [FiniteDiff.jl](https://github.com/JuliaDiff/FiniteDiff.jl) or [FiniteDifferences.jl](https://github.com/JuliaDiff/FiniteDifferences.jl).
