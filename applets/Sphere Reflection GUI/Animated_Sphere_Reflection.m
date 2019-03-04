function [ theta_difference ] = Animated_Sphere_Reflection( r, n, Nrefl )


if((r>=0 && r<=1) && (Nrefl==1 || Nrefl==2))
    thetaIncident = asin(r);

    if (nargout==0)
        if(Nrefl==1)
            thetaPolarPointIncidence = pi - thetaIncident; % polar angle of incidence point (INCIDENCE ABOVE HORIONTAL)
        else
            thetaPolarPointIncidence = pi + thetaIncident; % polar angle of incidence point (INCIDENCE BELOW HORIZONTAL)
        end
        
        if(Nrefl==1)
            plot( [-2 cos(thetaPolarPointIncidence)], [r r], 'Color', [1 1 1], 'LineWidth', 3); % ray of incidence
           
        else
            plot( [-2 cos(thetaPolarPointIncidence)], [-r -r], 'Color', [1 1 1], 'LineWidth', 3); % ray of incidence
        end
        
        for wavelength_nm=430:30:700
            RGB = calculateVisibleSpectrumColor( wavelength_nm );
            index=n(wavelength_nm);
            sphere_reflection(r, index, Nrefl, RGB, wavelength_nm );
        end
     end


     if(nargout==1)
         thetaRedPolar=sphere_reflection(r, n(750), Nrefl, [1 0 0] );
         thetaPurplePolar=sphere_reflection(r, n(380), Nrefl, [1 0 1] );
         if( thetaRedPolar<inf && thetaPurplePolar<inf )
             thetaRedDeg = (thetaRedPolar/(2*pi))*360;   
             thetaPurpleDeg = (thetaPurplePolar/(2*pi))*360;
             theta_difference= abs(thetaRedDeg-thetaPurpleDeg);
         else
             disp('Unable to determine range of spectrum due to total reflection occuring');
         end
    
     end
    
    disp('Ray path complete');
     
else
     disp('Arguments entered not in appropriate range')
end





end

