function [gMatrixRight,gMatrixDown] = getGradient(matrix)
    [m,n] = size(matrix);
    gMatrixRight = zeros(m,n-1);
    gMatrixDown = zeros(m-1,n);
   
    for i=1:m
        for j=1:n-1
            gMatrixRight(i,j) = matrix(i,j) - matrix(i,j+1);
        end
    end
    for i=1:m-1
        for j=1:n
            gMatrixDown(i,j) = matrix(i,j) - matrix(i+1,j);
        end
    end
end