classdef Lens
    %Lens is a class of lenses! It creates an object of thick lens-stop and
    %finds the equivalent optical system with transition matrix
   
    properties
        T=zeros(2,2) %the transition matriix of the lens
        leftPosition %the left position of the lens-stop
        rightPosition %the right position of the lens-stop
        height%the height of the lens-stop
        distance%the thickness of the lens
        n % the refractive index of the lens
        R1 %curvature of left surface
        R2 %curvature of right surface
        
       
    end
    
    methods
        
        function lensobj = Lens(leftPos, h, d, N, r1, r2,refrInd )
            
            lensobj.rightPosition=leftPos+d;
            lensobj.leftPosition=leftPos;
            lensobj.height=h;
            lensobj.distance=d;
            lensobj.n=N;
            lensobj.R1=r1;
            lensobj.R2=r2;
            
            lensobj.T(1,1)=1-d*((N-refrInd)/r1)/N;%A
            lensobj.T(1,2)=d/N;%B
            lensobj.T(2,1)=-(((N-refrInd)/r1)+((refrInd-N)/r2)-d*((N-refrInd)/r1)*((refrInd-N)/r2)/N);%C
            lensobj.T(2,2)=1-d*((refrInd-N)/r2)/N;%D 

        end
     
    end
    
end