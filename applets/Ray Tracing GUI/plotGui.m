function plotGui(lensArray,enPoint,direction)

hold on;

for i=1:1:size(lensArray,2)

    if (lensArray(i).distance==0)
       plotDiaphragm(lensArray(i)) 
    else
       plotLens(lensArray(i))
    end
    
end

arRay=rayTracer(enPoint,lensArray,direction);

plot([arRay(1).S,arRay(1).S],[-50 50],'color','green','LineStyle','-.')

plot([arRay(length(arRay)).S arRay(length(arRay)).S],[-50 50],'color','cyan','LineStyle','-.')

for k=1:2:size(arRay,2)
   
   plotRay(arRay(k),arRay(k+1))
  
end

end