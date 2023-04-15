powers = [0:1:5];
b = [1 0 0 0 1];
a = [1 -3 2];
[q, r] = deconv(b, a);
numerator_vector = [r(4) r(5) 0];
middle_vector = zeros(1, 3);
output_signal_synthetic = [q(end) zeros(1, length(powers) - 1)];

for i=1:length(powers) - 1

  middle_vector = numerator_vector(1) * a;
  output_signal_synthetic(i+1) = numerator_vector(1);

  for j=1:length(numerator_vector) - 1

    numerator_vector(j) = numerator_vector(j+1) - middle_vector(j+1);

  endfor

endfor

stem(powers, output_signal_synthetic);

