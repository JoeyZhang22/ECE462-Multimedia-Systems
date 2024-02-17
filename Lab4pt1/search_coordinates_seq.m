function search_list = search_coordinates_seq(x,y, M, N)

    %max indices possible
    x_min= x-8;
    y_min= y-8;
    if x_min <=1
        x_min=1;
    end
    if y_min <=1
        y_min=1;
    end

    %min indices possible
    x_max=x+8;
    y_max=y+8;
    if x_max >M-15
        x_max=M-15;
    end
    if y_max > N-15
        y_max=N-15;
    end

    search_list=zeros(((x_max-x_min)+1)*((y_max-y_min)+1),2);
    
    
    track=1;
    for i= x_min:1:x_max
        for j=y_min:1:y_max
            search_list(track,:)=[i, j];
            track=track+1;
        end
    end
end

