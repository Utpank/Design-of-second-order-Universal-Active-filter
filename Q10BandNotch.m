clear all;
clc;
%Close all;
fp = 1591.514;
Q = 10;
wo = 2*pi*fp;
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

% Bandstop filter at cutoff frequency = 10K rad/sec and Q = 10
num1 = [Ho/wo^2 0 Ho];
den1 = [1/wo^2 1/(wo*Q) 1];
H1 = tf(num1,den1);
%subplot(3,1,2)
figure(1)
bode (H1);
title('Band Notch Filter, wo = 10K rad/sec, Q = 10');
grid on;

%Pole zero plot for Band Notch Filter
%subplot(3,1,3);
figure(2)
h = pzplot( H1 );

% Unit step transient Response of system
figure(3)
step(H1);

% Impulse Response of system
figure(4)
h1 = impulseplot( H1 );

% Transient Response times
stepinfo(H1)

