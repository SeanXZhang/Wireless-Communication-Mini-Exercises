function I = CellInter2Path(N, xb, yb, Gamma)
I1 = 0;
I2 = 0;
D = 4/sqrt(3);
mu = 1;
sigma = 6;
l = lognrnd(0, sigma*log(10)/10, 1, N);
L1 = lognrnd(0, sigma*log(10)/10, 1, N);
L2 = lognrnd(0, sigma*log(10)/10, 1, N);
e = exprnd(mu, 1, N);
E1 = exprnd(mu, 1, N);
E2 = exprnd(mu, 1, N);

for k = 1:N
    x = D*rand(1)-D/2;
    y = 2*rand(1)-1;
    while (abs(y)+sqrt(3)*abs(x) > 2)
        x = D*rand(1)-D/2;
        y = 2*rand(1)-1;
    end
    I = I + ( (x^2+y^2)/((x-xb)^2+(y-yb)^2) )^(Gamma/2)/l(k)/e(k)*(2/3*L1(k)*E1(k)+1/3*L2(k)*E2(k));
end
