clc
%clear all
close all
file = uigetfile('*.csv');
Array=csvread(file,1,0);
%with an offset of 1 row and 0 columns
x = Array(:, 1);
y = Array(:, 2);
figure();
peakcurrent=max(y);
fprintf('Peak Current is:%f A',peakcurrent);
subplot(2,1,1);plot(x, y);%axis([0 0.0005 -2 2]);
title('Filtered graph');
xlabel('Time(ms)');ylabel('Current(A)');
dydx = diff([eps; y(:)])./diff([eps; x(:)]);%differentiate with respective x,
%with dydx having the same length as x
subplot(2,1,2);plot(x, dydx);
title('dA/dt graph');
xlabel('Time(s)');ylabel('Rate of Current(A/s)');
format long
maxA=max(dydx);
minA=min(dydx);
peakA=maxA/1000000;
if peakA>=1000 
    peakA=peakA/1000;
    fprintf('\nPeak rate of current is:%f GA/s',peakA);
else
    fprintf('\nPeak rate of current is:%f MA/s',peakA);
end
ysq=y.^2;
Int=trapz(x,ysq);
Int=abs(Int);
Int=sqrt(Int);
fprintf('\nRoot action is:%f s^1/2\n',Int);









