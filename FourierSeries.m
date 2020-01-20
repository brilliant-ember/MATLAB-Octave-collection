%To change the functino just change the uncommented func var

clc;
pkg load symbolic
% symbolic pkg has a python lib dependency,
% for me I have the SymPy in python3 so I have to change
% python env for octave

setenv PYTHON python3
sympref reset

% N is number of harmonics T0 is funddemental period
% function [a0, a, b] = FourierSeries(func, T0, N)

syms t;
N = 50;
T0 = 2; 
w0 = 2*pi/T0;

%this is like the step function u(t), but in matlab it is called heaviside
func=heaviside(t) - heaviside(t-1);

% The int function is integration
a0_symbolic = 1/T0*int(func, t, 0, T0);
% This is to convert from a symbolic type to a double type
a0 = double(a0_symbolic);
a = [];
b = [];

for n=1:N;
    a_func = 2/T0 * int(func*cos(n*w0*t), t, 0, T0);
    b_func = 2/T0 * int(func*sin(n*w0*t), t, 0, T0);

    a(n) = double(a_func);
    b(n) = double(b_func);
end
%endfunction

%Now to plot, if you want to see the evolution 
%you can put a pause in the loop

%tnum = [0:0.01:6];
%fnum = a0;
%for n=1:N;
%    harmonic = a(n) * cos(n*w0+tnum) + b(n)*sin(n*w0+tnum);
%    fnum = fnum+harmonic;
%    plot(tnum, fnum);
%end



%f=heaviside(t) - heaviside(t-1);
%[a0, a, b] = FourierSeries(f,2,10 )
