function focal = findFocal(lensArray,n)

T=findTotalT(lensArray,1,size(lensArray,2),n);
f1=-n*T(2,2)/T(2,1);
f2=-n*T(1,1)/T(2,1);
F1=lensArray(1).leftPosition-f1;
focal(1)=F1;
F2=lensArray(size(lensArray,2)).rightPosition+f2;
focal(2)=F2;

end