# Io3dP

[![Build Status](https://travis-ci.org/mjirik/Io3dP.jl.svg?branch=master)](https://travis-ci.org/mjirik/Io3dP.jl)
[![Coveralls](https://coveralls.io/repos/github/mjirik/Io3dP.jl/badge.svg?branch=master)](https://coveralls.io/github/mjirik/Io3dP.jl?branch=master)


Wrapper for python `Io3d` package.


# Install

Install `Io3d` for Python. In command line use:
```bash
conda install -c mjirik -c conda-forge -c SimpleITK Io3d

which python
```

In Julia

```julia
ENV["PYTHON"] = "/home/mirjirik/space/conda-env/julia/bin/python"
] add PyCall
] build PyCall
] add https://github.com/mjirik/Io3dP.jl
using Io3dP
```


# Test

```julia
using Io3dP
Io3dP.datasets_download("nrn4")
datap = Io3dP.read3d(Io3dP.datasets_join_path("medical/orig/sample_data/nrn4.pklz"))
seg = data["data3d"] .> 4000
```

# Get labels

List of all available labels for `dataset_download` function can be obtained by fallowing command.

```julia
using Io3dP
Io3dP.get_labels()
```
