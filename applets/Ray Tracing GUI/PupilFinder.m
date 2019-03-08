function [ S_pupilEn, height_idol_En, S_pupilEx, height_idol_Ex  ] = PupilFinder( lens, aperture_index_surface, aperture_index_lens, refr_index )
%PENFINDER Summary of this function goes here
%   Detailed explanation goes here

    if(aperture_index_surface==0) %left surface
        S_pupilEn=findIdol( lens, lens(aperture_index_lens).leftPosition,0 , refr_index ); %To the left we will only worry about the idol of the right surface of the lens(more limiting)
        S_pupilEx=findIdol( lens, lens(aperture_index_lens).leftPosition,1 , refr_index ); %%To the right we will only worry about the idol of the left surface of the lens(more limiting)
    
        Point1En=RayPoints(lens(aperture_index_lens).leftPosition ,lens(aperture_index_lens).height, 0 ,refr_index, [1,1,1]);
        Point1Ex=RayPoints(lens(aperture_index_lens).leftPosition ,lens(aperture_index_lens).height, 0 ,refr_index, [1,1,1]);
    
    else %right surface
        S_pupilEn=findIdol( lens, lens(aperture_index_lens).rightPosition,0 , refr_index ); %To the left we will only worry about the idol of the right surface of the lens(more limiting)
        S_pupilEx=findIdol( lens, lens(aperture_index_lens).rightPosition,1 , refr_index ); %%To the right we will only worry about the idol of the left surface of the lens(more limiting)
    
        Point1En=RayPoints(lens(aperture_index_lens).rightPosition ,lens(aperture_index_lens).height, 0 ,refr_index, [1,1,1]);
        Point1Ex=RayPoints(lens(aperture_index_lens).rightPosition ,lens(aperture_index_lens).height, 0 ,refr_index, [1,1,1]);
    end 
    
    
    arRayEn=rayTracer(Point1En, lens, 0, S_PupilEn); % a change in RayTracer is needed in order to be able to go up to a specific position
    arRayEx=rayTracer(Point1Ex, lens, 1, S_PupilEx);
    
    height_idol_En=arRayEn(length(ArRayEn)).u;
    height_idol_Ex=arRayEx(length(arRayEx)).u;

end

