function NS_21_DFT_Sonar(N_zp,L)

% USAGE: NS_21_DFT_Sonar(N_zp,L)
% 
% Inputs:  N_zp = integer specifying DFT length including zero padding
%          L = pulse duration in samples
%
% Outputs: Various plots of results... no returned values


%%% Set N_zp & L if user doesn't specify them
if nargin==0
        L = 230;     % set length of pulse in samples
        N_zp=L+200;   % This sets N_zp so there is no zero padding as the default
end


Fs=4000;   % Set the sampling rate
T=1/Fs;    % Set the sample spacing

%%%  Create the transmitted signal with a frequency of 1000 Hz
x_tx=[zeros(1,100) cos(2*pi*1000*(0:(L-1))*T) zeros(1,100)];
%%%  Create the transmitted signal with a frequency 710 Hz
x_rx=[zeros(1,100) cos(2*pi*710*(0:(L-1))*T) zeros(1,100)];

t=-100:(L+99);  % create a time vector that is the same length as the signal

if length(t) > N_zp
    error('N_zp must be at least as big aas the signal length')
end


figure
subplot(3,1,1)
h=plot(t/1e-3,x_rx);
set(h,'linewidth',2)
set(gca,'fontsize',12)
xlabel('time (ms)')
ylabel('x_{rx}(t) (v)')
grid


X=fftshift(fft(x_rx,N_zp));   
% the N_zp inside the fft command sets the length *including* zero-padding 

N = length(X);

Omega=(-(N/2):((N/2)-1))*2*pi/N;  %% DT Frequency... -pi to pi

subplot(3,1,3)
h=plot(Omega/pi,abs(X));
set(h,'linewidth',2)
set(gca,'fontsize',12)
xlabel('\Omega/\pi (Normalized rad/sec)')
ylabel('|X_{rx}[k]|')
grid

f=(Fs/2)*(Omega/pi);   %%%  Convert into equivalent Hz values

subplot(3,1,2)
h=plot(f,abs(X));
set(h,'linewidth',2)
set(gca,'fontsize',12)
xlabel('f  (Hz)')
ylabel('|X_{rx}[k]|')
grid


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add some random Gaussian noise to the signal & compute DFT
x_rx_n=x_rx+0.8*randn(size(x_rx));
X_n=fftshift(fft(x_rx_n,N_zp));

figure

subplot(3,1,1)
h=plot(t/1e-3,x_rx);
set(h,'linewidth',2)
set(gca,'fontsize',12)
xlabel('time (ms)')
ylabel('x_{rx}(t) (v)')
title('Noise-Free Signal in Time Domain')
grid

subplot(3,1,2)
h=plot(t/1e-3,x_rx_n);
set(h,'linewidth',2)
set(gca,'fontsize',12)
xlabel('time (ms)')
ylabel('x_{rx}(t) (v)')
title('Noisy Signal in Time Domain')
grid

subplot(3,1,3)
h=plot(f,abs(X_n));
set(h,'linewidth',2)
set(gca,'fontsize',12)
xlabel('f  (Hz)')
ylabel('|X_{rx}[k]|')
title('DFT of Noisy Signal')
grid