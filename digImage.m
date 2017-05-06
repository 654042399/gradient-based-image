function digged = digImage(image,S)
    [M,N] = size(image);
    imgVec = reshape(image',M*N,1);
    diggedVec = S * imgVec;
    digged = vec2mat(diggedVec,N);
    
end