%%
%3.2
a = gendatb([50 50]);
w1 = nmc(a);
w2 = ldc(a);
w3 = qdc(a);
w4 = fisherc(a);
w5 = parzenc(a,0.5);
w6 = knnc(a,1);
scatterd(a);
plotc(w1,'r');
plotc(w2,'y');
plotc(w3,'g');
plotc(w4,'b');
plotc(w5,'c');
plotc(w6);

a(:,2) = 10*a(:,2);

%%
%Week 4 Perceptron
%clc,clear;
%a = gendats([20 20],2,6);
[nlab lablist] = getnlab(a);
c = 2 * nlab - 3;
w = randn(1,3);
complete = 0;
n = 0;
bo = 0.5;
while(complete == 0)
    n = n+1;
    complete = 1;
    for i = 1:length(+a)
        boo = (w*[(+a(i,:)),1]'-c(i)*bo)*c(i);
        if boo < 0
           w = w + 0.5*c(i).*[(+a(i,:)),1];
           complete = 0;
           break
        end
    end
end

scatterd(a);
V = axis;
x2 = V(3:4);
x1 = -(x2*w(2)+w(3))/w(1);
hold on; plot(x1,x2,'r-');