# Io3d

[![Build Status](https://travis-ci.org/mjirik/Io3d.jl.svg?branch=master)](https://travis-ci.org/mjirik/Io3d.jl)
[![Coveralls](https://coveralls.io/repos/github/mjirik/Io3d.jl/badge.svg?branch=master)](https://coveralls.io/github/mjirik/Io3d.jl?branch=master)


Wrapper for pytho `io3d` package.


# Install

Install `io3d` for Python. In command line use:
```bash
conda install -c mjirik -c conda-forge -c SimpleITK io3d

which python
```

In Julia

```julia
ENV["PYTHON"] = "/home/mirjirik/space/conda-env/julia/bin/python"
] add https://github.com/mjirik/Io3d.jl
using Io3d
```


# Test

```julia
using Io3d
Io3d.datasets_download("nrn4")
datap = Io3d.read3d(Io3d.datasets_join_path("medical/orig/sample-data/nrn4.pklz"))
seg = data["data3d"] .> 4000
```

# Get labels

List of all available labels for `dataset_download` function can be obtained by fallowing command.

```julia
using Io3d
Io3d.get_labels()
```
