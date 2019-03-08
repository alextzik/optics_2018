function totalT = findTotalT( lens, index_start, index_stop, refrIndex )
    totalT=[1,0;0,1];
    for i=index_start:1:index_stop-1
        totalT=lens(i).T* totalT;
        P=findPropT(lens(i).rightPosition, lens(i+1).leftPosition, refrIndex);
        totalT=P* totalT;
    end
    
    totalT=lens(index_stop).T* totalT;
   
end

