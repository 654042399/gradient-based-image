function G = getG(M,N,A,B,m,n)
% This function return gradient vector of specific part
% M,N original image size
% A,B distance to the cut
% m,n cut size
    GR = sparse(M*(N-1),M*N);
    GD = sparse((M-1)*N,M*N);
    for i=A:A+m-1
        for j=B:B+n
            GR(i*(N-1)+j,i*N+j) = 0.5;
            GR(i*(N-1)+j,i*N+j+1) = -0.5;
        end
    end
    for i=A-1:A+m-1
        for j=B+1:B+n
            GD(i*N+j,i*N+j) = 0.5;
            GD(i*N+j,(i+1)*N+j) = -0.5;
        end
    end
    G = [GR',GD'];  %right first
    G = G';
    
end