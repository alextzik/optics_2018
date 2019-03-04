function [thetaFinal]= sphere_reflection(r, n, Nrefl, ColorTriple, wavelength )
    % r: vertical distance of incident point from horizontal
    % n: refraction coefficient of sphere
    % Nrefl: number of reflections inside the sphere 
    % ColorTriple: array with the color of the ray
    
    thetaIncident = asin(r); % thetaIncident: angle of incident of ray (<(horizontal, radius to point of incidence))

    thetaRefract = asin((sin(thetaIncident)/n)); % thetaRefract: angle between radius and refracted ray (thetaRefract<thetaIncident=thetaRefractOutwards)

    
    if (nargout==0)
     
    
        if(Nrefl==1)
        
            thetaPolarPointIncidence = pi - thetaIncident; % polar angle of incidence point (INCIDENCE ABOVE HORIONTAL)

            thetaPolarPoint1 = 2*thetaRefract - thetaIncident ; % Point of first reflection

            thetaPolarPoint2 = thetaPolarPoint1 - (pi - 2* thetaRefract);  % Point of Refraction outwards
           
            plot([cos(thetaPolarPointIncidence) cos(thetaPolarPoint1)], [sin(thetaPolarPointIncidence) sin(thetaPolarPoint1)], 'Color', ColorTriple, 'LineWidth', 2); % 1st ray inside the circle
            
            plot([cos(thetaPolarPoint1) cos(thetaPolarPoint2)], [sin(thetaPolarPoint1) sin(thetaPolarPoint2)], 'Color', ColorTriple, 'LineWidth', 2); % 2nd ray inside the circle
           
            
            if(thetaRefract<asin(1/n))
                thetaRefractOutwards = asin(n*sin(thetaRefract)); % angle of refraction outwards measured between radius of point and refracted ray
                thetaOutputPoint2 = abs(-pi -  thetaPolarPoint2) - thetaRefractOutwards; % output angle for refraction at point2 below horizontal - point2 above horizontal is not possible because the necessary inequality doesn't hold
            
                plot( [cos(thetaPolarPoint2) cos(thetaPolarPoint2)-1], [sin(thetaPolarPoint2) sin(thetaPolarPoint2)-1*(sin(thetaOutputPoint2)/cos(thetaOutputPoint2))], 'Color', ColorTriple, 'LineWidth', 2); % refracted ray
                
                if(wavelength==430 || wavelength==700)
                    line( [cos(thetaPolarPoint2) -2], [sin(thetaPolarPoint2) sin(thetaPolarPoint2)], 'Color', calculateVisibleSpectrumColor(wavelength), 'LineStyle', '-.', 'LineWidth', 0.5);
                
                    ang([cos(thetaPolarPoint2) sin(thetaPolarPoint2)],0.2 ,[-pi -pi+thetaOutputPoint2],'--', calculateVisibleSpectrumColor(wavelength));  
                end
            end
        end
    
        if(Nrefl==2)
        
            thetaPolarPointIncidence = pi + thetaIncident; % polar angle of incidence point (INCIDENCE BELOW HORIZONTAL)
         
            thetaPolarPoint1 = thetaIncident - 2*thetaRefract; % Point of first reflection
         
            thetaPolarPoint2 = thetaPolarPoint1 + (pi - 2* thetaRefract);  % Point of Second Reflection 
         
            thetaPolarPoint3 = thetaPolarPoint2 + (pi - 2*thetaRefract); % Point of Refraction outwards 
        
            plot( [cos(thetaPolarPointIncidence) cos(thetaPolarPoint1)], [sin(thetaPolarPointIncidence) sin(thetaPolarPoint1)], 'Color', ColorTriple, 'LineWidth', 2); % 1st ray inside the circle
            
            plot( [cos(thetaPolarPoint1) cos(thetaPolarPoint2)], [sin(thetaPolarPoint1) sin(thetaPolarPoint2)], 'Color', ColorTriple, 'LineWidth', 2); % 2nd ray inside the circle
            
            plot( [cos(thetaPolarPoint2) cos(thetaPolarPoint3)], [sin(thetaPolarPoint2) sin(thetaPolarPoint3)], 'Color', ColorTriple, 'LineWidth', 2); % 3rd ray inside circle
            
            if(thetaRefract<asin(1/n))
                 thetaRefractOutwards = asin(n*sin(thetaRefract)); % angle of refraction outwards measured between radius of point and refracted ray

                 if((pi-thetaPolarPoint3)<0) % find the refraction point's location on the circle (here below horizontal)
               
                    thetaOutputPoint3 = abs(pi - thetaPolarPoint3) + thetaRefractOutwards; % output angle for Nrefl=2 
                 else
                    thetaOutputPoint3 = thetaRefractOutwards - abs(pi - thetaPolarPoint3) ; 
                end  
                 
                if(pi>=thetaOutputPoint3  && thetaOutputPoint3>=pi/2) % direction towards +x, -y
                    plot( [cos(thetaPolarPoint3) cos(thetaPolarPoint3)+1], [sin(thetaPolarPoint3) (sin(thetaPolarPoint3)-((sin(pi - thetaOutputPoint3)/cos(pi - thetaOutputPoint3))))], 'Color', ColorTriple, 'LineWidth', 2); % refracted ray
                  
                    if(wavelength==700 || wavelength==430)
                        ang([cos(thetaPolarPoint3) sin(thetaPolarPoint3)],0.2 ,[-pi -pi+thetaOutputPoint3],'--', calculateVisibleSpectrumColor( wavelength)); 
                        plot( [cos(thetaPolarPoint3) -2], [sin(thetaPolarPoint3) sin(thetaPolarPoint3)], 'Color', [0 0 0], 'LineStyle', '-.');
                    end
                    
                elseif(0<=thetaOutputPoint3 && thetaOutputPoint3<pi/2) % direction towards -x, -y
                    plot( [cos(thetaPolarPoint3) cos(thetaPolarPoint3)-1], [sin(thetaPolarPoint3) (sin(thetaPolarPoint3)-((sin(thetaOutputPoint3)/cos(thetaOutputPoint3))))], 'Color', ColorTriple, 'LineWidth', 2); % refracted ray
   
                    if(wavelength==700 || wavelength==430)
                        ang([cos(thetaPolarPoint3) sin(thetaPolarPoint3)],0.2 ,[-pi -pi+thetaOutputPoint3],'--', calculateVisibleSpectrumColor( wavelength)); 
                        plot( [cos(thetaPolarPoint3) -2], [sin(thetaPolarPoint3) sin(thetaPolarPoint3)], 'Color', [0 0 0], 'LineStyle', '-.');
                    end
                end
             
        
            % the spheres are supposed to be higher up than our eye -> we only
            % care for r above horizontal in Nrefl=1 (in order to have the ray
            % come out below the hoizontal) and r below horizontal in Nrefl=2
            % for the same reason
        
            end
        end 
        hold on;
    end


    if(nargout==1)
        if(Nrefl==1)    
            thetaPolarPointIncidence = pi - thetaIncident; % polar angle of incidence point (INCIDENCE ABOVE HORIONTAL)

            thetaPolarPoint1 = 2*thetaRefract - thetaIncident ; % Point of first reflection

            thetaPolarPoint2 = thetaPolarPoint1 - (pi - 2* thetaRefract);  % Point of Refraction outwards
            
            if(thetaRefract<asin(1/n))
                thetaRefractOutwards = asin(n*sin(thetaRefract)); % angle of refraction outwards measured between radius of point and refracted ray
                thetaOutputPoint2 = abs(-pi -  thetaPolarPoint2) - thetaRefractOutwards; % output angle for refraction at point2 below horizontal - point2 above horizontal is not possible because the necessary inequality doesn't hold
            
                thetaFinal = (thetaOutputPoint2/(2*pi))*360;
            else
                thetaFinal=inf;
            end
        end
    
        if(Nrefl==2)
            thetaPolarPointIncidence = pi + thetaIncident; % polar angle of incidence point (INCIDENCE BELOW HORIZONTAL)
         
            thetaPolarPoint1 = thetaIncident - 2*thetaRefract; % Point of first reflection
         
            thetaPolarPoint2 = thetaPolarPoint1 + (pi - 2* thetaRefract);  % Point of Second Reflection 
         
            thetaPolarPoint3 = thetaPolarPoint2 + (pi - 2*thetaRefract); % Point of Refraction outwards
         
            if(thetaRefract<asin(1/n))
                thetaRefractOutwards = asin(n*sin(thetaRefract)); % angle of refraction outwards measured between radius of point and refracted ray
                if((pi-thetaPolarPoint3)<0) % find the refraction point's location on the circle (here below horizontal)
               
                    thetaOutputPoint3 = abs(pi - thetaPolarPoint3) + thetaRefractOutwards; % output angle for Nrefl=2 
                else
                    thetaOutputPoint3 = thetaRefractOutwards - abs(pi - thetaPolarPoint3) ; 
                end 
                    
                thetaFinal = (thetaOutputPoint3/(2*pi))*360;
            else
                thetaFinal=inf;
            end
        end
    
    end
    
end
    



