function nodal = findNodal(lensArray)

nodal(1)=lensArray(1).leftPosition;

nodal(2)=lensArray(size(lensArray,2)).rightPosition;

end