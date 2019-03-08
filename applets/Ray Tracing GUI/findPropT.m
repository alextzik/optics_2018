function ABCD = findPropT(x1,x2,n)

S=abs(x1-x2);

ABCD=zeros(2,2);
ABCD(1,1)=1;
ABCD(1,2)=S/n;
ABCD(2,1)=0;
ABCD(2,2)=1;



end