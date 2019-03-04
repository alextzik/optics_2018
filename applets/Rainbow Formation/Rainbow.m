function Rainbow


       sld = uicontrol('Style','slider','Min', 0.2, 'Max', 0.6, 'Value', 0.2, 'SliderStep', [0.02 0.05], 'Position', [340 50 120 20], 'Visible', 'on', 'Callback', @callbackfn);
       txt = uicontrol('Style','text', 'Position', [340 80 120 30], 'String','Vertical Distance of Incident Ray', 'Visible', 'on');
       
       
       function callbackfn(source, callbackdata)
               r=get(sld, 'value');
 
               eqRedFirst=sphere_reflection(r, (-0.000022*700+1.34), 1, calculateVisibleSpectrumColor( 700 ), 700, -100);
               eqBlueLast=sphere_reflection(r, (-0.000022*430+1.34), 1, calculateVisibleSpectrumColor( 430 ), 430, -60);
               sol=solve([eqRedFirst, eqBlueLast]);
               intersectX=sol.x;
               intersectY=sol.y;
               disp(double(intersectX))
               limX=floor(-intersectX);
               disp(limX);
               limY=floor(intersectY);
               disp(limY);
            % Create circles
                hold on;
                figure(1);
                axis equal;
                axis([-15000 5 -2840 2810]);
                h=rectangle('Position', [-15000 -2810 15005 5620]);
                k=rectangle('Position', [-15000 -2840 15005 30]);
                set(h, 'FaceColor', [0.8 0.8 0.8]);
                set(k, 'FaceColor', [0.2 1 0.5]);
                for i=-100:2:-60
                    xc = cos( linspace(0,2*pi,200) );
                    yc = sin( linspace(0,2*pi,200) );
                    c=patch(xc,yc-i, [0 0 1]);
                    set(c, 'FaceColor', [0 1 1]);
                    set(c, 'EdgeColor', [0 0 0]);
                end  
                pause(0.2);
                for j=-100:2:-60
                    Animated_Sphere_Reflection(r, @(x)(-0.000022*x+1.34), 1, j);
                    pause(0.05);
                end
                plot([double(-intersectX) double(-intersectX)], [-2810 double(intersectY)], 'Color', [1 1 1], 'LineWidth', 2);
               
                %{
                pause(2);
                hold off;
                
                axis equal;
                axis([-2820 5 -630 2195]);
                h=rectangle('Position', [-2820 -585 2825 2780]);
                hold on;
                k=rectangle('Position', [-2820 -630 2825 45]);
                set(h, 'FaceColor', [0.8 0.8 0.8]);
                set(k, 'FaceColor', [0.2 1 0.5]);
                for i=0:2:8
                    xc = cos( linspace(0,2*pi,200) );
                    yc = sin( linspace(0,2*pi,200) );
                    c=patch(xc,yc-i, [0 0 1]);
                    set(c, 'FaceColor', [0 1 1]);
                    set(c, 'EdgeColor', [0 0 0]);
                end  
                
                for j=0:2:8
                    
                    
                end
                l=animatedline(double(-intersectX), -585, 'Color', [1 1 1], 'LineWidth', 2);
                addpoints(l, double(-intersectX), double(intersectY));
                %}
                hold off;
                
          
       end 
   
end
       
       

