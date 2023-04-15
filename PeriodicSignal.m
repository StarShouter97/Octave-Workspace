% The Time interval
k = 1:0.1:10;

% (Fo) The Original Frequency
Fo = 0.5;

% (Fs1) The Sampling Frequency @ sqrt(5)*Fo
Fs1 = sqrt(5) * Fo;

% (Fs2) The Sampling Frequency @ 2*Fo
Fs2 = 2 * Fo;

Wo = 2*pi*Fo;

% (Ts1) is The Sampling time @ Fs1
Ts1 = 1/Fs1;

% (Ts2) is the Sampling time @ Fs2
Ts2 = 1/Fs2;

t1 = k * Ts1;
t2 = k * Ts2;

% (x1) The Sampling Signal @ Fs1
x1 = cos(Wo * t1);

% (X2) The Sampling Signal @Fs2
x2 = cos(Wo * t2);

% (s) is The Original Signal
s = cos(Wo * k);

% Overlapping the Sampling Signal and The Original Signal
subplot(3, 2, 1);
plot(s);
title('The Original Frequency');
subplot(3, 2, 3);
stem(x1);
title('Sampling Frequency @ sqrt(5)*Fo');
subplot(3, 2, 5);
plot(s);
hold on
stem(x1)
title('Overlapping the 2 Frequencies');

subplot(3, 2, 2);
plot(s);
title('The Original Frequency');
subplot(3, 2, 4);
stem(x2);
title('Sampling Frequency @ 2*Fo');
subplot(3, 2, 6);
plot(s);
hold on
stem(x2);
title('Overlapping the 2 Frequencies');

