using Pio3d
using Test

@testset "Pio3d.jl" begin

    @test "nrn4" in Pio3d.get_labels()
    Pio3d.datasets_download("nrn4")
    pth = Pio3d.datasets_join_path("medical/orig/sample_data/nrn4.pklz")
    @test length(pth) > 0
    datap = Pio3d.read3d(pth)
    data3d = datap["data3d"]
    @test eltype(data3d) == UInt16

#     labels = Pio3d.get_labels()
    new_fn = "test_output_nrn4.dcm"

    # delete file if output file exists
    rm(new_fn, force=true)
    Pio3d.write3d(data3d, new_fn)
    @test isfile(new_fn)
    # Write your own tests here.
end

@testset "test read" begin
    pth = Pio3d.datasets_join_path("medical/orig/sample_data/nrn4.pklz")
    datap = Pio3d.read3d(pth)

    data3d = datap["data3d"]
    # eltype(data3d)
    @test size(data3d) == (7,7,6)

end
