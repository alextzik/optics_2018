function [ index_surface, index_lens ] = ApertureStopFinder( lens, S_observe, refr_index )
%APERTURESTOPFINDER Summary of this function goes here
%   Detailed explanation goes here
    first_point=RayPoints(S_observe,0,2*pi/360,refr_index, [1,1,1]);
    arRay=rayTracer(first_point,lens, 1);
    
    ratio=-inf;
    for i=2:1:length(aRay)
        if (abs(arRay(i).u/lens(floor(i/2)).height))>ratio
            ratio=(abs(arRay(i).u/lens(floor(i/2)).height));
            if(mod(i,2)==0)
                index_surface=0;
            else
                index_surface=1;
            end
            
            index_lens=floor(i);
            
        end
    end
    

end

