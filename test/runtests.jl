using Io3d
using Test

@testset "Io3d.jl" begin
    labels = Io3d.get_labels()

    Io3d.datasets_download("nrn4")
    pth = Io3d.datasets_join_path("medical/orig/sample-data/nrn4.pklz")
    @test length(pth) > 0
    datap = Io3d.read3d(pth)
    data3d = datap["data3d"]
    @test eltype(data3d) == UInt16

    Io3d.write3d(data3d, "test_output_nrn4.dcm")
    # Write your own tests here.
end
