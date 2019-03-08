function arRay = rayTracer(pointsEnObj,lensArray,direction)

lensIndex=findClosestLens(lensArray,pointsEnObj.S,direction)-1;
    
if(direction==1) %right
        % It sets a beginning point
        arRay(1)=RayPoints(pointsEnObj.S,pointsEnObj.u,pointsEnObj.phi,pointsEnObj.n,pointsEnObj.color);
        t=findPropT(arRay(1).S,lensArray(1).leftPosition,arRay(1).n);
        y=findNextPoint(arRay(1).rArray,t); 
        arRay(2)=RayPoints(lensArray(1).leftPosition,y(1,1),y(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
        
        i=lensIndex+1;
        while i<size(lensArray,2) && arRay(2*(i-lensIndex)).u<lensArray(i).height
            
            %It finds the new characteristics (u1 and n*phi1) of the previous
            %point after the refraction in the lens number i 
            d=findNextPoint(arRay(2*(i-lensIndex)).rArray,lensArray(i).T);
            %It sets a point at the position of the lens number i with the new
            %characteristics
            arRay(2*(i-lensIndex)+1)=RayPoints(lensArray(i).rightPosition,d(1,1),d(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
            
             %It calculates the transition matrix of propagation of the ray
            P=findPropT(arRay(2*(i-lensIndex)+1).S,lensArray(i+1).leftPosition,arRay(1).n);
            %It calculates the array [u1;n*phi1] after the propagation to the lens
            %number i
            z=findNextPoint(arRay(2*(i-lensIndex)+1).rArray,P);
            %It sets a point at the position of the thin lens number i+1
            arRay(2*(i-lensIndex)+2)=RayPoints(lensArray(i+1).leftPosition,z(1,1),z(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
            
            i=i+1;
        end
        
        if(i==size(lensArray,2))
            %It finds the new characteristics (u1 and n*phi1) of the previous
            %point after the refraction in the lens number i 
            D=findNextPoint(arRay(2*(i-lensIndex)).rArray,lensArray(i).T);
            %It sets a point at the position of the lens number i with the new
            %characteristics
            arRay(2*(i-lensIndex)+1)=RayPoints(lensArray(i).rightPosition,D(1,1),D(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);


            idol=findIdol(lensArray,pointsEnObj.S,direction,pointsEnObj.n);
            p=findPropT(arRay(size(arRay,2)).S,arRay(size(arRay,2)).S+idol,arRay(1).n);
            finalRay=findNextPoint(arRay(size(arRay,2)).rArray,p);
            arRay(2*(size(lensArray,2)-lensIndex)+2)=RayPoints(arRay(2*(size(lensArray,2)-lensIndex)).S+idol,finalRay(1,1),finalRay(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
        end
        
        
        
elseif(direction==0) %left
    
    T=findTotalT(lensArray,1,lensIndex,pointsEnObj.n);
    ar2=pointsEnObj.rArray;
    ar1=T\ar2;
    S1=findIdol(lensArray,pointEnObj.S-lensArray(lensIndex).rightPosition,0,pointEnObj.n);
    
    % It sets a beginning point
    arRay(1)=RayPoints(S1,ar1(1,1),ar1(2,1)/pointsEnObj.n,pointsEnObj.n,pointsEnObj.color);
    m=findPropT(arRay(1).S,lensArray(1).leftPosition,arRay(1).n);
    s=findNextPoint(arRay(1).rArray,m); 
    arRay(2)=RayPoints(lensArray(1).leftPosition,s(1,1),s(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
    
        k=1;
        while k<lensIndex && arRay(2*k).u<lensArray(k).height
            %It finds the new characteristics (u1 and n*phi1) of the previous
            %point after the refraction in the lens number i 
            v=findNextPoint(arRay(2*k).rArray,lensArray(k).T);
            %It sets a point at the position of the lens number i with the new
            %characteristics
            arRay(2*k+1)=RayPoints(lensArray(k).rightPosition,v(1,1),v(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
            
             %It calculates the transition matrix of propagation of the ray
            G=findPropT(arRay(2*k+1).S,lensArray(k+1).leftPosition,arRay(1).n);
            %It calculates the array [u1;n*phi1] after the propagation to the lens
            %number i
            g=findNextPoint(arRay(2*k+1).rArray,G);
            %It sets a point at the position of the thin lens number i+1
            arRay(2*k+2)=RayPoints(lensArray(k+1).leftPosition,g(1,1),g(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
            
            k=k+1;
        end
        
       if(k==lensIndex)
            %It finds the new characteristics (u1 and n*phi1) of the previous
            %point after the refraction in the lens number i 
            M=findNextPoint(arRay(2*k).rArray,lensArray(k).T);
            %It sets a point at the position of the lens number i with the new
            %characteristics
            arRay(2*k+1)=RayPoints(lensArray(k).rightPosition,M(1,1),M(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
            
            l=findPropT(arRay(size(arRay,2)).S,pointsEnObj.S,arRay(1).n);
            fRay=findNextPoint(arRay(size(arRay,2)).rArray,l);
            arRay(2*lensIndex+2)=RayPoints(pointsEnObj.S,fRay(1,1),fRay(2,1)/arRay(1).n,arRay(1).n,pointsEnObj.color);
       end
        
else
    disp('Error in arguments'); 
end



end