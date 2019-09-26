N = 100;
Gamma = 4;
Inter = [];
nbins = 1e3;
for n = 1:1e5
    Inter(n) = 6/N*( CellInter(N,sqrt(3),1,Gamma) +  CellInter(N,sqrt(3),3,Gamma) + CellInter(N,0,4,Gamma) + CellInter(N,0,6,Gamma) + 2*CellInter(N,sqrt(3),5,Gamma) );    
end

MeanInter = mean(Inter)
VarInter = var(Inter)
hist(Inter, nbins)
xlabel('Interference Value', 'FontSize', 16)
ylabel('Count', 'FontSize', 16)
title('Inter-cell Interference for Two Component Multipath with One-finger Rake Receiver',  'FontSize', 16)
xlim([0 20])
grid on
