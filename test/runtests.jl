using Io3dP
using Test

@testset "Io3dP.jl" begin

    @test "nrn4" in Io3dP.get_labels()
    Io3dP.datasets_download("nrn4")
    pth = Io3dP.datasets_join_path("medical/orig/sample_data/nrn4.pklz")
    @test length(pth) > 0
    datap = Io3dP.read3d(pth)
    data3d = datap["data3d"]
    @test eltype(data3d) == UInt16

#     labels = Io3dP.get_labels()
    new_fn = "test_output_nrn4.dcm"

    # delete file if output file exists
    rm(new_fn, force=true)
    Io3dP.write3d(data3d, new_fn)
    @test isfile(new_fn)
    # Write your own tests here.
end

@testset "test read" begin
    pth = Io3dP.datasets_join_path("medical/orig/sample_data/nrn4.pklz")
    datap = Io3dP.read3d(pth)

    data3d = datap["data3d"]
    # eltype(data3d)
    @test size(data3d) == (7,7,6)

end
