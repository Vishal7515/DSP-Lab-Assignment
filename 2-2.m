iv.	Design a low pass Chebyshev filter type-1 (using bilinear transformation) for the following specifications. 
a.	Pass band ripple=2.5dB 
b.	Stop band ripple=25dB 
c.	Pass band frequency=1200Hz 
d.	Stop band frequency=1850Hz 
e.	Sampling frequency=8kHz 
  Show all the design steps. Plot and verify the same using MATLAB.

clc;
clear all;
close all;
rp=input('Enter the pass band ripple (in dB)');
rs=input('Enter the stop band ripple (in dB)');
fs=input('Enter the sampling frequency (in Hz)');
fp=input('Enter the pass band frequency (in Hz)');
fst=input('Enter the stop band frequency (in Hz)');
fn=fs/2;%normalized sampling frequency
fpn=fp/fn;%normalized pass band frequency
fstn=fst/fn;%normalized stop band frequency
[N,wc]=cheb1ord(fpn,fstn,rp,rs);
[b,a]=cheby1(N,rp,wc);
  
Transferfunc=tf(b,a,(1/fs))
 
[H,f]=freqz(b,a,256,fs);
H_mag=20*log10(abs(H));
figure;
plot(f,H_mag);
grid on;
xlabel('Frequency in Hz');
ylabel('Magnitude in dB');
title('Magnitude Response');
