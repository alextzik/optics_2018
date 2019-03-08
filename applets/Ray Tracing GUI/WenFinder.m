function [ S_WEn, height_idol_En ] = WenFinder( lens, FS_index_surface, FS_index_lens, refr_index )
%WENFINDER Summary of this function goes here
%   Detailed explanation goes here
     if(FS_index_surface==0) %left surface
        S_WEn=findIdol( lens, lens(FS_index_lens).leftPosition,0 , refr_index ); %To the left we will only worry about the idol of the right surface of the lens(more limiting)
        
        Point1En=RayPoints(lens(FS_index_lens).leftPosition ,lens(FS_index_lens).height, 0 ,refr_index, [1,1,1]);
       
    else %right surface
        S_WEn=findIdol( lens, lens(FS_index_lens).rightPosition,0 , refr_index ); %To the left we will only worry about the idol of the right surface of the lens(more limiting)
       
        Point1En=RayPoints(lens(FS_index_lens).rightPosition ,lens(FS_index_lens).height, 0 ,refr_index, [1,1,1]);
        
    end 
    
    
    arRayEn=rayTracer(Point1En, lens, 0, S_WEn); % a change in RayTracer is needed in order to be able to go up to a specific position
   
    height_idol_En=arRayEn(length(ArRayEn)).u;
    

end

