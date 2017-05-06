
% M,N: image size
% A,B: cut distance
% m,n: segment image size

%% example 1
M = 333;
N = 250;
A = 225;
B = 5;
m = 70;
n = 70;
img1 = imread('source.png');
img2 = imread('destination.jpg');

%% example 2
M = 800;
N = 1280;
A = 270;
B = 900;
m = 350;
n = 300;
img1 = imread('sor2.jpg');
img2 = imread('des2.jpg');

%% example 3
M = 333;
N = 250;
A = 225;
B = 5;
m = 70;
n = 70;
img1 = imread('source.png');
img2 = imread('des3.jpg');

%%
img1 = double(img1)/255;
img2 = double(img2)/255;
img1 = imresize(img1,[M N]);
img2 = imresize(img2,[M N]);
img1_r = img1(:,:,1);
img1_g = img1(:,:,2);
img1_b = img1(:,:,3);
img2_r = img2(:,:,1);
img2_g = img2(:,:,2);
img2_b = img2(:,:,3);

%%
alpha = 0.1;

%%
G = getG(M,N,A,B,m,n);
S = getS(M,N,A,B,m,n);
u_mat = zeros(M,N,3);

%%
for i=1:3
    %calculate gradient
    img1_vector = reshape(img1(:,:,i)',1,M*N);
    img1_vector = img1_vector';
    g = G * img1_vector;
    g = clearBoundary(g,M,N,A,B,m,n);

    img2_vector = reshape(img2(:,:,i)',M*N,1);
    img2_vector = S * img2_vector;

    U = ((G' * G) +alpha * (S' * S))\((G' * g) + alpha * (S' * S * img2_vector));
    u_mat(:,:,i) = vec2mat(U',N);
    
end
%%
imshow(u_mat)
%%

