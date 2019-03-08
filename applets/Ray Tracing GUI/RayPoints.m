classdef RayPoints
   %It represents a class of points of the ray. Especially, these points are the
   %intersections of the ray and the equivalent thin lenses
    properties
        
        S %Is the horizontally position
        u %Is the transverse position
        phi %Is the angle between the optical axis and the direction of the ray
        n %Is the refracted index
        rArray=zeros(2,1) %Is the array [u1 ; n*phi1]
        color=zeros(1,3)
        
    end
    
    methods
        
        function rayobj = RayPoints(s,U,p,N,c) %constructor
            %creates an object of class RayPoints and initialize its
            %properties
            
            rayobj.S=s;
            rayobj.u=U;
            rayobj.phi=p;
            rayobj.n=N;
            rayobj.rArray(1,1)=U; %u
            rayobj.rArray(2,1)=N*p; %n*phi
            rayobj.color=c;
            
        end
       
    end
    
end