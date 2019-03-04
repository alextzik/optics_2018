function GUI_Sphere_reflection


       sld = uicontrol('Style','slider','Min', -1, 'Max', 1, 'SliderStep', [0.02 0.05], 'Position', [340 50 120 20], 'Visible', 'on', 'Callback', @callbackfn);
       txt = uicontrol('Style','text', 'Position', [340 80 120 30], 'String','Vertical Distance of Incident Ray', 'Visible', 'on');
       
       
       function callbackfn(source, callbackdata)
           
            % Create circle
                hold on;
                figure(1);
                axis equal;
                axis([-1.5 1.5 -1.5 1.5]);
                h=rectangle('Position', [-1.5 -1.5 3 3]);
                set(h, 'FaceColor', [0.8 0.8 0.8]);
                xc = cos( linspace(0,2*pi,200) );
                yc = sin( linspace(0,2*pi,200) );
                c=patch(xc,yc, [0 0 1]);
                set(c, 'FaceColor', [0 1 1]);
                set(c, 'EdgeColor', [0 0 0]);
                line( [-2 2], [0 0], 'Color', [0 0 0], 'LineStyle', ':');
       
                r=get(sld, 'value');
                % Set the incident ray
                if(r>=0) %Nrefl==1
                    Nrefl=1;

                else %Nrefl==2
                    Nrefl=2;
                    r=-r;
                end 
            
            
                Animated_Sphere_Reflection(r, @(x)(-0.000022*x+1.34), Nrefl);
                hold off;
            
            
          
       end 
   
end
       
       

