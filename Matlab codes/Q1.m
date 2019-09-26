clc;

fc = 1e9;
c = 3e8;
v = 50/3.6;

df1 = fc*v/c;
df2 = fc*v/c/sqrt(2);

dt21 = 11.25e-2/c;
dt22 = 7.5e-2*sqrt(3)*sin(pi/12)/c;
dt23 = -3.75e-2*sqrt(3)/c;

dt31 = dt21;
dt32 = 7.5e-2*sqrt(3)*cos(pi/12)/c;
dt33 = -dt23;

dt = 1e-6;
T = 0.2;
t = 0:dt:T;

s1 = exp(j*2*pi*df1*t) + 1/sqrt(2)*exp(j*2*pi*df2*t) + 1/sqrt(2);
s2 = exp(j*2*pi*(fc+df1)*(t-dt21)) + 1/sqrt(2)*exp(j*2*pi*(fc+df2)*(t-dt22)) + 1/sqrt(2)*exp(j*2*pi*fc*(t-dt23));
s3 = exp(j*2*pi*(fc+df1)*(t-dt31)) + 1/sqrt(2)*exp(j*2*pi*(fc+df2)*(t-dt32)) + 1/sqrt(2)*exp(j*2*pi*fc*(t-dt33));

E1 = abs(s1);
E2 = abs(s2);
E3 = abs(s3);

SNR1 = 10*E1.^2;
SNR2 = 10*E2.^2;
SNR3 = 10*E3.^2;

SNRav1 = 1/T*sum(SNR1*dt)
SNRav2 = 1/T*sum(SNR2*dt)
SNRav3 = 1/T*sum(SNR3*dt)

SNRmin1 = min(SNR1)
SNRmin2 = min(SNR2)
SNRmin3 = min(SNR3)

SNRc = SNR1+SNR2+SNR3;
SNRavC = 1/T*sum(SNRc*dt)
SNRminC = min(SNRc)

figure
t = t*1e3;
plot(t,E1,t,E2,t,E3)
legend('E_{1}(t)','E_{2}(t)','E_{3}(t)');
xlabel('t [ms]', 'FontSize', 16);
grid on

figure
plot(t,10*log(SNR1),t,10*log(SNR2),t,10*log(SNR3))
legend('SNR_{1}(t)','SNR_{2}(t)','SNR_{3}(t)');
xlabel('t [ms]', 'FontSize', 16);
ylabel('SNR [dB]', 'FontSize', 16);
grid on

figure
plot(t,10*log(SNRc))
legend('SNR_{c}(t)');
xlabel('t [ms]', 'FontSize', 16);
ylabel('SNR [dB]', 'FontSize', 16);
grid on
