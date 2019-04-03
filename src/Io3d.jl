module Io3d
using PyCall

greet() = print("Hello World!")



"""
Read 3D data from file. Data are stored int dictionary with keys "data3d" and "voxelsize_mm".
"""
function read3d(fn)
    pyio3d = pyimport("io3d")
    return pyio3d["read"](fn);
end

function datasets_join_path(pth)
    pyio3d_datasets = pyimport("io3d.datasets")
    print(pth)
    opth = pyio3d_datasets["join_path"](pth, get_root=true)
    print(opth)
    return opth
end

"""
Download test data based on input label. Available labels can be list by get_labels()
"""
function datasets_download(label)
    pyio3d_datasets = pyimport("io3d.datasets")
#     print(pth)
    pyio3d_datasets["download"](label)
end

"""
Write data into file. Data have to be in dict with labels "data3d" and "voxelsize_mm".
"""
function write3d(arr, fn)
    pyio3d = pyimport("io3d")
    return pyio3d["write"](arr, fn);
#     print(pth)
end


"""
Get list of available datasets labels.
"""
function get_labels()
    pyio3d_datasets = pyimport("io3d.datasets")
    labels = pyio3d_datasets["get_labels"]()
    return labels
end

end # module
