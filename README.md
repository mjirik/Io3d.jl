# Pio3d

[![Build Status](https://travis-ci.org/mjirik/Pio3d.jl.svg?branch=master)](https://travis-ci.org/mjirik/Pio3d.jl)
[![Coveralls](https://coveralls.io/repos/github/mjirik/Pio3d.jl/badge.svg?branch=master)](https://coveralls.io/github/mjirik/Pio3d.jl?branch=master)


Wrapper for python `io3d` package.

Package is used to read 3D data from various file formats like DICOM, tiff.
There is also support for open datasets download and organization datasets in
data directory.


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
] add https://github.com/mjirik/Pio3d.jl
using Pio3d
```


# Test

```julia
using Pio3d
Pio3d.datasets_download("nrn4")
datap = Pio3d.read3d(Pio3d.datasets_join_path("medical/orig/sample_data/nrn4.pklz"))
seg = data["data3d"] .> 4000
```

# Get labels

List of all available labels for `dataset_download` function can be obtained by fallowing command.

```julia
using Pio3d
Pio3d.get_labels()
```
