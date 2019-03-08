function [ index ] = findClosestLens( lens, position, left_or_right )
    %It returns the index of the closest to the left or right lens from the
    %horizontal position 'position'
    index_left=0;
    index_right=0;
    if (position<=lens(1).leftPosition)
        index_left=0;
        index_right=1;
    end
    
    for i=1:1:size(lens,2)-1
        if(position>=lens(i).rightPosition && position<=lens(i+1).leftPosition)
            index_left=i;
            index_right=i+1;
        end
    end
    
    if (position>=lens(size(lens,2)).rightPosition)
        index_left=length(lens);
        index_right=0;
    end
    
    if(left_or_right==0) %zero for left and one for right
        index=index_left;
    else
        index=index_right;
    end


end

