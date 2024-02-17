function search_list = search_coordinates_log(x,y, M, N,current_p)

    %max indices possible
    x_min= x-current_p;
    y_min= y-current_p;
    if x_min <=1
        x_min=1;
    end
    if y_min <=1
        y_min=1;
    end

    %min indices possible
    x_max=x+current_p;
    y_max=y+current_p;
    if x_max >M-15
        x_max=M-15;
    end
    if y_max > N-15
        y_max=N-15;
    end

    xd= ((x_max-x_min)/current_p)+1
    xy=((y_max-y_min)/current_p)+1
    
    n=xd*xy
    search_list=zeros(n,2)
    
    
    track=1;
    for i= x_min:current_p:x_max
        for j=y_min:current_p:y_max
            search_list(track,:)=[i, j];
            track=track+1;
        end
    end
end