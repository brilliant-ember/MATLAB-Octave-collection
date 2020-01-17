%to run in terminal: octave --persist --eval test

% x = linspace(0,4*pi,100);
T = 2; %this is the period
x = linspace(0, 10, 10);
y = exp(-x/T);
% y = sin(2*pi/T .*x);
m = [];
% this loop creates a simple step piecewise function (square)
for i =1 :length(x)
    if i > length(x)/2
        m(i) = -1;
    else
        m(i) = +1;
    endif
end
convlotion = conv(m,y);
% Because if you plot just plot(conv), it doesnt start at zero without 
% the second var
rowForPlt = linspace(0, length(convlotion), length(convlotion));

subplot(2,2,2);
plot(x,m);
title("the square function");
grid on;

subplot(2,2,1);
plot(x,y);
title("the exponent");
grid on;

subplot(2,2,3);
plot(rowForPlt,convlotion);
title("The convlotion of the two");
grid on;

