function focalRay(lensArray,point)

F=findFocal(lensArray,point.n);
P1F1=F(1)-point.S;
phi=atan(point.u/P1F1);
fPoint=RayPoints(point.S,point.u,phi,point.n,point.color);
arRay=rayTracer(fPoint,lensArray,1);

for k=1:2:size(arRay)
   plotRay(arRay(k),arRay(k+1))
end

end