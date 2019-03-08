function [ S_FS lens_index surface_index] = FieldStopFinder( S_pupilEn, lens, refr_index )
%FIELDSTOPFINDER Summary of this function goes here
%   Detailed explanation goes here
    firstPoint=RayPoints(S_pupilEn,0,4*pi/360,refr_index,[1,1,1]);
    arRayRight=rayTracer(firstPoint, lens, 1);
    arRayLeft=rayTracer(firstPoint, lens, 0);
    
    closestLensRight=findClosestLens( lens, S_pupilEn, 1 );
    closestLensLeft=findClosestLens( lens, S_pupilEn, 0 );
    
    ratio=-inf;
    for i=2:1:length(arRayRight)
        if (abs(arRay(i).u/lens(floor(i/2)+ closestLensRight-1).height))>ratio
            ratio=(abs(arRay(i).u/lens(floor(i/2)+ closestLensRight-1).height));
            if(mod(i,2)==0)
                S_FS=lens(floor(floor(i/2)+ closestLensRight-1)).leftposition;
                surface_index=0;
            else
                S_FS=lens(floor(floor(i/2)+ closestLensRight-1)).rightposition;
                surface_index=1;
            end
            lens_index=floor(i/2)+ closestLensRight-1;
        end
    end
    
    for i=2:1:length(arRayLeft)
        if (abs(arRay(i).u/lens(-floor(i/2)+ closestLensLeft+1).height))>ratio
            ratio=(abs(arRay(i).u/lens(-floor(i/2)+ closestLensLeft+1).height));
            if(mod(i,2)==0)
                S_FS=lens(-floor(i/2)+ closestLensLeft+1).rightposition;
                surface_index=1;
            else
                S_FS=lens(-floor(i/2)+ closestLensLeft+1).leftposition;
                surface_index=0;
            end
            lens_index=-floor(i/2)+ closestLensRight+1;
        end
    end
    
    

end

