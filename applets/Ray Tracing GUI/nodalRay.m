function nodalRay(lensArray,point)

N=findNodal(lensArray);
P1N1=N(1)-point.S;
phi=atan(point.u/P1N1);
fPoint=RayPoints(point.S,point.u,phi,point.n,point.color);
arRay=rayTracer(fPoint,lensArray,1);

for k=1:2:size(arRay)
   plotRay(arRay(k),arRay(k+1))
end

end