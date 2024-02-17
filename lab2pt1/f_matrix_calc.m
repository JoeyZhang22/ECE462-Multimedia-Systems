function F = f_matrix_calc(n)
    %dimension of matrix F is NxN
    F =zeros(n,n);
    
    %iterate through matrix of F
    for i = 1:n 
        for j=1:n
            if i==1
                F(i,j)=sqrt(1/n) * cos((2*(j-1)+1)*(i-1)*pi/(2*n)) ;   
            else
                F(i,j)=sqrt(2/n) * cos((2*(j-1)+1)*(i-1)*pi/(2*n))  ;  
            end
        end

    end
end