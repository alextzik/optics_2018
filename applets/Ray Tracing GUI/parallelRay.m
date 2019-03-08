function parallelRay(lensArray,point)

parPoint=RayPoints(point.u,point.S,0,point.n,point.color);

arRay=rayTracer(parPoint,lensArray,1);

for i= 1:2:size(arRay)
   plotRay(arRay(i),arRay(i+1)) 
end

end