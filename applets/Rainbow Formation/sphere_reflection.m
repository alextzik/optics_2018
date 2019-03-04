function [equation]= sphere_reflection(r, n, Nrefl, ColorTriple, wavelength, height )
    % r: vertical distance of incident point from horizontal
    % n: refraction coefficient of sphere
    % Nrefl: number of reflections inside the sphere 
    % ColorTriple: array with the color of the ray
    
    thetaIncident = asin(r); % thetaIncident: angle of incident of ray (<(horizontal, radius to point of incidence))

    thetaRefract = asin((sin(thetaIncident)/n)); % thetaRefract: angle between radius and refracted ray (thetaRefract<thetaIncident=thetaRefractOutwards)

    thetaRefractOutwards = asin(n*sin(thetaRefract)); % angle of refraction outwards measured between radius of point and refracted ray

    thetaPolarPointIncidence = pi - thetaIncident; % polar angle of incidence point (INCIDENCE ABOVE HORIONTAL)

    thetaPolarPoint1 = 2*thetaRefract - thetaIncident ; % Point of first reflection

    thetaPolarPoint2 = thetaPolarPoint1 - (pi - 2* thetaRefract);  % Point of Refraction outwards
           
    thetaOutputPoint2 = abs(-pi -  thetaPolarPoint2) - thetaRefractOutwards; % output angle for refraction at point2 below horizontal - point2 above horizontal is not possible because the necessary inequality doesn't hold
    
    syms x y
    eqn= sin(thetaPolarPoint2)-(x-cos(thetaPolarPoint2))*(sin(thetaOutputPoint2)/cos(thetaOutputPoint2))-height-y==0;
    
    
    if (nargout==0)
     
    
        if(Nrefl==1)
        
            plot([cos(thetaPolarPointIncidence) cos(thetaPolarPoint1)], [sin(thetaPolarPointIncidence)-height sin(thetaPolarPoint1)-height], 'Color', ColorTriple, 'LineWidth', 2); % 1st ray inside the circle
            
            plot([cos(thetaPolarPoint1) cos(thetaPolarPoint2)], [sin(thetaPolarPoint1)-height sin(thetaPolarPoint2)-height], 'Color', ColorTriple, 'LineWidth', 2); % 2nd ray inside the circle
            
            
            if(thetaRefract<asin(1/n))
                syms x
                eqn1= sin(thetaPolarPoint2)-(x)*(sin(thetaOutputPoint2)/cos(thetaOutputPoint2))-height+2810==0;
                plane_point=double(solve(eqn1, x));
                plot( [cos(thetaPolarPoint2) cos(thetaPolarPoint2)-plane_point], [sin(thetaPolarPoint2)-height -2810], 'Color', ColorTriple, 'LineWidth', 0.5); % refracted ray
              
                if(wavelength==430 || wavelength==700)
                    line( [cos(thetaPolarPoint2) -2], [sin(thetaPolarPoint2)-height sin(thetaPolarPoint2)-height], 'Color', calculateVisibleSpectrumColor(wavelength), 'LineStyle', '-.', 'LineWidth', 0.5);
                
                    disp(thetaOutputPoint2/(2*pi)*360);
                    ang([cos(thetaPolarPoint2) sin(thetaPolarPoint2)-height],0.2 ,[-pi -pi+thetaOutputPoint2],'--', calculateVisibleSpectrumColor(wavelength));  
                end
            end
        end
    
        hold on;
    end


    if(nargout==1)
        if(Nrefl==1)    
            if(thetaRefract<asin(1/n))
                equation=eqn;
            else
                equation=inf;
            end
        end
    
    
    end
    
end
    



