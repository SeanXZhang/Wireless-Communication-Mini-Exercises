function I = CellInter(N, xb, yb, Gamma)
I = 0;
D = 4/sqrt(3);
mu = 0;
sigma = 6;
L = lognrnd(mu*log(10)/10,sigma*log(10)/10,1,N);
l = lognrnd(mu*log(10)/10,sigma*log(10)/10,1,N);
for k = 1:N
    x = D*rand(1)-D/2;
    y = 2*rand(1)-1;
    while (abs(y)+sqrt(3)*abs(x) > 2)
        x = D*rand(1)-D/2;
        y = 2*rand(1)-1;
    end
    I = I + ( (x^2+y^2)/((x-xb)^2+(y-yb)^2) )^(Gamma/2)*L(k)/l(k);
end
