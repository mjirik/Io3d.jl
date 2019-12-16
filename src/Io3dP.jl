module Io3dP
using PyCall

greet() = print("Hello World!")



"""
Read 3D data from file. Data are stored int dictionary with keys "data3d" and "voxelsize_mm".
"""
function read3d(fn)
    pyIo3d = pyimport("Io3d")
    return pyIo3d."read"(fn; dataplus_format=true);
end

"""
Read 3D data from file. Data are stored int dictionary with keys "data3d" and "voxelsize_mm".
"""
function read(fn)
    return read3d(fn)
end

function datasets_join_path(pth)
    pyIo3d_datasets = pyimport("Io3d.datasets")
    opth = pyIo3d_datasets."join_path"(pth, get_root=true)
    return opth
end

"""
Download test data based on input label. Available labels can be list by get_labels()
"""
function datasets_download(label)
    pyIo3d_datasets = pyimport("Io3d.datasets")
#     print(pth)
    pyIo3d_datasets."download"(label)
end

"""
Write data into file. Data have to be in dict with labels "data3d" and "voxelsize_mm".
"""
function write3d(arr, fn)
    pyIo3d = pyimport("Io3d")
    return pyIo3d."write"(arr, fn);
#     print(pth)
end


"""
Get list of available datasets labels.
"""
function get_labels()
    pyIo3d_datasets = pyimport("Io3d.datasets")
    labels = pyIo3d_datasets."get_labels".()
    return labels
end

end # module
