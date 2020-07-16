clc;
clear;
close all;
 
ap=-3.01;
as=-42;
fp=1600;
fs=2500;
 
op=2*pi*fp; 
os=2*pi*fs; 
A=log10((10^(-ap/10)-1)/(10^(-as/10)-1 ));
B=2*log10(op/os);
N= A/B;
N=ceil(N);
disp('Orderofthefilter,N=');
disp(N);
 
oc=os/((10^(-as/10)-1)^(1/(2*N)));
 
disp('Cutoff freq,oc=');
disp(oc);
 
%using inbuilt function
 
[N,oc]=buttord(op,os,-ap,-as,'s');
[b,a]=butter(N,oc,'s');
 
fr=0:100:4000;
wr=2*pi*fr;
 
[H,w]=freqs(b,a,wr);
f=w/(2*pi);
H_mag=20*log10(abs(H));
figure;
plot(f,H_mag);
grid on;
xlabel('Frequency in Hz');
ylabel('Magnitude in dB');
title('Magnitude Response');
 
Transferfunc = tf(b,a);
