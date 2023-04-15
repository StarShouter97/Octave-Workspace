x_Axis = [0:30];
index = [1:31];
y_Initial = zeros(1, 33);
h = zeros(1, 31);
x = [[0, 1], zeros(1,30)];
y_Output_Convolution = zeros(1, 31);
y_Output_ClosedForm = zeros(1, 31);

for i=1:31

  h(i) = (0.6 * y_Initial(i+1)) - (0.05 * y_Initial(i)) + (2 * x(i+1)) + x(i);
  y_Initial(i+2) = h(i);

  y_Output_ClosedForm(i) = (7.92 * power(0.8, x_Axis(i))) ...
                                       - (6.67 * power(0.5, x_Axis(i))) ...
                                       + (0.343 * power(0.1, x_Axis(i)));

  for j=1:i

    y_Output_Convolution(i) += (h(j) * (power(0.8, index(i+1-j))));

  endfor

endfor

legStr = {'Closed Form', 'Convolution'};
stem(x_Axis, y_Output_ClosedForm, 'rx');
hold on
stem(x_Axis, y_Output_Convolution);
legend(legStr, 'orientation', 'horizontal');

