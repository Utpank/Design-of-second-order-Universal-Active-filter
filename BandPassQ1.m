clear all;
clc;
%Close all;
fp = 159.1514;
Q = 1;
wo = 2*pi*fp; % wo = 1K rad/sec for Q=1
Ho = 1;

%Resistance and capacitance values for Second Order Universal Active filter
C1 = 100e-9;  %Assuming available value of Capacitance
C2 = C1;
R1 = 1/(wo*C1); 
R2 = R1/Ho; % Ho = Gain of Operational Amplifier
R3 = R1*Q; % As specified in ASLK pro manuel Kit.
R7 = R1;
R4 = R1;
R6 = R1;
R5 = R1;
R8 = R1;

% BandPass filter at cutoff frequency = 1K rad/sec (f = 159.1514 Hz) and Q = 1
num1 = [0 -Ho/wo 0];
den1 = [1/wo^2 1/(wo*Q) 1];
H1 = tf(num1,den1);
%subplot(3,1,2)
figure(1)
bode (H1);
title('Band Pass Filter, wo = 1K rad/sec, Q = 1');
grid on;

%Pole zero plot for Band Pass Filter
%subplot(3,1,3);
figure(2)
h = pzplot( H1 );

% Unit step Response of Bandpass filter
figure(3)
step(H1);

% Impulse Response of Bandpass filter
figure(4)
h1 = impulseplot( H1 );

% Transient Response information
stepinfo(H1)

