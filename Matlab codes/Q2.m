N = 100;
Gamma = 3;
Inter = [];
nbins = 1e3;
for n = 1:1e5
    Inter(n) = 6/N*( CellInter(N,sqrt(3),1,Gamma) +  CellInter(N,sqrt(3),3,Gamma) + CellInter(N,0,4,Gamma) + CellInter(N,0,6,Gamma) + 2*CellInter(N,sqrt(3),5,Gamma) );
%F = 1/(1+Inter)
%Inter
end

MeanInter = mean(Inter)
VarInter = var(Inter)
hist(Inter, nbins)
xlabel('Interference Value', 'FontSize', 16)
ylabel('Count', 'FontSize', 16)
title('Inter-cell Interference with \gamma = 3 and Log-normal Fading',  'FontSize', 16)
xlim([0 30])
grid
