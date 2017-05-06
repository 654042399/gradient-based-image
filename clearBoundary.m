function gNew = clearBoundary(g,M,N,A,B,m,n)
    for i=0:m-1
        g(A*(N-1)+i*(N-1)+B) = 0;
        g(A*(N-1)+i*(N-1)+B+n) = 0;
    end
    for i=1:n
        g(M*(N-1)+(A-1)*N+B+i) = 0;
        g(M*(N-1)+(A+m-1)*N+B+i) = 0;
    end
    gNew = g;
end