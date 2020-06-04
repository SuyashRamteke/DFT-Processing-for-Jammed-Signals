# DFT-Processing-for-Jammed-Signals

Scenario #1

You have a system intended to receive a sinusoidal RF signal whose frequency is unknown but is known to be one of the following
18 frequencies (all in GHz): 1.0075, 1.0125, 1.0175, ... , 1.0925. Note: spacing is 5 MHz.
1.0075 1.0125 1.0175
Assume that the signal is available as a LPE signal that has been sampled such that –π
rad/sample corresponds to 1.0 GHz and +π rad/sample corresponds to 1.1 GHz.
Consider that you are going to process the LPE signal to detect the presence of the sinusoid in noise but that someone is 
trying to prevent you from doing so by “jamming” your receiver: they are going to transmit a signal in the 1.0 GHz to 1.1 GHz 
band that will mask the sinusoid to be detected.
Note that this is the same scenario as the first problem in Evaluation #1! So, you already know what the LPE signal looks like 
for this scenario.
      
Assume that your adversary has two options available for the jamming signal:
• A sum of 19 sinusoids of equal amplitude that are uniformly spread in frequency across the 1.0 GHz to 1.1 GHz band at the 
following frequencies (in GHz): 1.005, 1.01, 1.015,
1.02, ... , 1.095. Note spacing is 5 MHz.
• A random signal that can be modeled as white and Gaussian (for the LPE this should be modeled as complex-valued noise)
Assume you know the following:
• For the sinusoidal jamming scenario: The received power of the desired sinusoid is 60 dB
below the power of any one of the jamming sinusoids
• For the white noise jamming scenario: The SNR is -60 dB
• The receiver’s internal noise power is negligible
Assuming that an auxiliary subsystem can detect which of the two jamming schemes is being used, define and test two DFT processing schemes (one for each of the two jamming signals) that can ensure detection of the desired sinusoid in the presence of the jammer – obviously you need to strive to keep the number of samples used as small as possible. Your system will work directly on the LPE signal that you can assume is provided by some other processing that precedes your processing. Thus in your simulation you can directly simulate the proper LPE signal and don’t need to simulate the RF signal.

Scenario #2

Instead of the sinusoidal signal used in Scenario #1 you have a desired LPE signal that can be modeled as a real-valued 
Gaussian noise filtered through an FIR filter with two taps of [1 1]. Here you only need consider the sinusoidal jamming 
signal. The SNR is -10 dB. Design and test linear phase FIR comb filters that can be used to remove the jamming signal from 
the received signal. The output of the filter should be an approximation of the true underlying desired signal – you can 
compare this approximation to the desired signal but be sure to account for the delay imparted by the filter. 
The intent is NOT to yield a single design but rather to explore the tradeoff between complexity of the filter and the 
quality of the approximation (you can numerically assess the quality by computing the power1 of the error in the approximation). 
You should explore and report on the relationship between complexity and quality to allow the readers of your report to make 
that tradeoff themselves.
