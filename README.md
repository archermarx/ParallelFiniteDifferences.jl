# ParallelFiniteDifferences

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://archermarks.github.io/ParallelFiniteDifferences.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://archermarks.github.io/ParallelFiniteDifferences.jl/dev/)
[![Build Status](https://github.com/archermarks/ParallelFiniteDifferences.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/archermarks/ParallelFiniteDifferences.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/archermarks/ParallelFiniteDifferences.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/archermarks/ParallelFiniteDifferences.jl)


Simple package for computing finite differences in parallel for relatively expensive black-box functions.
Currently only supports multithreading and forward differences.
For best performance, make sure to start julia with a number of threads at least one greater than the dimension of the problem (i.e. for a four dimensional problem use at least 5 threads).
