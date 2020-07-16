
clc;
clear all;
close all;
 
ap=-3;
as=-40;
fp=1000;
fs=2000;
 
op=2*pi*fp; 
os=2*pi*fs; 
A=log10((10^(-ap/10)-1)/(10^(-as/10)-1 ));
B=2*log10(op/os);
N= A/B;
N=ceil(N);
disp('Orderofthefilter,N=');
disp(N);
 
