using ParallelFiniteDifferences
using Documenter

DocMeta.setdocmeta!(ParallelFiniteDifferences, :DocTestSetup, :(using ParallelFiniteDifferences); recursive=true)

makedocs(;
    modules=[ParallelFiniteDifferences],
    authors="Thomas Marks <marksta@umich.edu> and contributors",
    sitename="ParallelFiniteDifferences.jl",
    format=Documenter.HTML(;
        canonical="https://archermarks.github.io/ParallelFiniteDifferences.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/archermarks/ParallelFiniteDifferences.jl",
    devbranch="main",
)
