function [ S ] = findIdol( lens, dist, left_or_right, refr_index ) %left_or_right=0 for left, 1 for right
    %It returns the distance S in which the idol will form 
    %If we require the idol to the left of a point we regard the point as
    %the idol, consider right propagation and look to find the point that
    %creates the 'idol' (distance S1)
    %Else we look to find the idol to right proapagation from a point as
    %usual
    lens_index=findClosestLens( lens, dist, left_or_right);
    
    if(left_or_right==0) %left
        T=findTotalT(lens, 1, lens_index, refr_index);
        S2=dist-lens(lens_index).rightPosition;
        syms x
        eqn = T(1,1)*x/refr_index+T(2,2)*S2/refr_index+T(2,1)*S2*x/(refr_index*refr_index)+T(1,2)==0;
        S1=solve(eqn, x);
        S=S1;
    else %right
        T=findTotalT(lens, lens_index, length(lens), refr_index);
        S1=-dist+lens(lens_index).leftPosition;
        syms x
        eqn = T(1,1)*S1/refr_index+T(2,2)*x/refr_index+T(2,1)*S1*x/(refr_index*refr_index)+T(1,2)==0;
        S2=solve(eqn, x);
        S=S2;
        
    end


end

