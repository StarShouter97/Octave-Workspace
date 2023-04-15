powers = [0:1:5];
b = [1 0 0 0 1];
a = [1 -3 2];
[q, r] = deconv(b, a);

%For Partial Fraction
%--------------------------------------------------------------------
[x, y] = residue([r(4) r(5)], a);
output_signal_partial = [q(end) zeros(1, length(powers) - 1)];
step_signal = [0 ones(1, length(powers) - 1)];
%--------------------------------------------------------------------

%For Synthetic Division
%--------------------------------------------------------------------
numerator_vector = [r(4) r(5) 0];
middle_vector = zeros(1, 3);
output_signal_synthetic = [q(end) zeros(1, length(powers) - 1)];
%--------------------------------------------------------------------

for i=1:length(powers) - 1

    % The Partial Fraction Method
    %--------------------------------------------------------------------
    output_signal_partial(i+1) = ((x(1) * power(y(1), i-1)) ...
                         + (x(2) * power(y(2), i-1))) * step_signal(i+1);
    %--------------------------------------------------------------------

    % The Synthetic Division Method
    %--------------------------------------------------------------------
    middle_vector = numerator_vector(1) * a;
    output_signal_synthetic(i+1) = numerator_vector(1);

    for j=1:length(numerator_vector) - 1

      numerator_vector(j) = numerator_vector(j+1) - middle_vector(j+1);

    endfor
    %--------------------------------------------------------------------

endfor

legStr = {'Partial Fraction', 'Synthetic Division'};
stem(powers, output_signal_partial, 'rx');
hold on
stem(powers, output_signal_synthetic);
legend(legStr, 'orientation', 'horizontal');

