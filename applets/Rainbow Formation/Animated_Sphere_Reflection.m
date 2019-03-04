function [ theta_difference ] = Animated_Sphere_Reflection( r, n, Nrefl, height)


if((r>=0 && r<=1) && (Nrefl==1))
    thetaIncident = asin(r);
    eq1=sphere_reflection(r, n(430), Nrefl, calculateVisibleSpectrumColor( 430 ), 430, -60 );
    eq3=sphere_reflection(r, n(700), Nrefl, calculateVisibleSpectrumColor( 700 ), 430, -100 );
    if (nargout==0)
       
        thetaPolarPointIncidence = pi - thetaIncident; % polar angle of incidence point (INCIDENCE ABOVE HORIONTAL)

         plot( [-15000 cos(thetaPolarPointIncidence)], [r-height r-height], 'Color', [1 1 1], 'LineWidth', 3); % ray of incidence
  
        for wavelength_nm=700:-40:700-(100+height)*6.75 %replace 40 with 1 for better detail
            RGB = calculateVisibleSpectrumColor( wavelength_nm );
            index=n(wavelength_nm);
            sphere_reflection(r, index, Nrefl, RGB, wavelength_nm, height );
        end
    
     end


     if(nargout==1)
         theta_difference=inf;
         disp('Error')
    
     end
    
    disp('Ray path complete');
     
else
     disp('Arguments entered not in appropriate range')
end





end

