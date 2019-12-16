module Io3dP
using PyCall

greet() = print("Hello World!")



"""
Read 3D data from file. Data are stored int dictionary with keys "data3d" and "voxelsize_mm".
"""
function read3d(fn)
    pyIo3dP = pyimport("Io3dP")
    return pyIo3dP."read"(fn; dataplus_format=true);
end

"""
Read 3D data from file. Data are stored int dictionary with keys "data3d" and "voxelsize_mm".
"""
function read(fn)
    return read3d(fn)
end

function datasets_join_path(pth)
    pyIo3dP_datasets = pyimport("Io3dP.datasets")
    opth = pyIo3dP_datasets."join_path"(pth, get_root=true)
    return opth
end

"""
Download test data based on input label. Available labels can be list by get_labels()
"""
function datasets_download(label)
    pyIo3dP_datasets = pyimport("Io3dP.datasets")
#     print(pth)
    pyIo3dP_datasets."download"(label)
end

"""
Write data into file. Data have to be in dict with labels "data3d" and "voxelsize_mm".
"""
function write3d(arr, fn)
    pyIo3dP = pyimport("Io3dP")
    return pyIo3dP."write"(arr, fn);
#     print(pth)
end


"""
Get list of available datasets labels.
"""
function get_labels()
    pyIo3dP_datasets = pyimport("Io3dP.datasets")
    labels = pyIo3dP_datasets."get_labels".()
    return labels
end

end # module
