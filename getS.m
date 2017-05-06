function S = getS(M,N,A,B,m,n)
% M,N original image size
% A,B distance to the cut
% m,n cut size
    a = 1:M*N;
    S=sparse(a,a,ones(1,M*N));
    for i=1:m
        for j=1:n
            S(A*N+(i-1)*N+B+j,A*N+(i-1)*N+B+j) = 0;
        end
    end
end