module TrackingLoopFilters

    using StaticArrays, Unitful, DocStringExtensions
    import Unitful: MHz, kHz, Hz, s, ms, upreferred
    
    

    include("FilterStructs.jl")


    function loop_filter(state::AbstractLoopFilter, δθ, Δt, bandwidth)
        ω₀ = Float64(bandwidth / Hz) * 4.0
        Δt_sec = Float64(upreferred(Δt/s))
        propagate(state, δθ, Δt_sec, bandwidth)
        out = filtered_output(state, δθ, Δt_sec, bandwidth) * Hz
    end


    include("FirstOrderLF.jl")
    include("SecondOrderLF.jl")
    include("ThirdOrderLF.jl") 
    
end








 




    






