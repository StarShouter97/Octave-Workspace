initial_conditions = [2, 3;
                      17, 21;
                      13, 20;
                      40, 90];

output_signal = zeros(4, 15);
total_signal_values = [initial_conditions, output_signal];

x_label = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
y = zeros(4, 15);

for i=1:4
  for j=1:15

    y(i, j) = (0.6 * total_signal_values(i, j+1)) - (0.05 * total_signal_values(i, j));
    total_signal_values(i, j+2) = y(i, j);

  endfor
endfor

subplot(4, 1, 1);
stem(x_label, y(1, :));
title(cstrcat("@ y(-1)= ", mat2str(initial_conditions(1, 2)), " and y(-2)= ",
              mat2str(initial_conditions(1, 1))));

subplot(4, 1, 2);
stem(x_label, y(2, :));
title(cstrcat("@ y(-1)= ", mat2str(initial_conditions(2, 2)), " and y(-2)= ",
              mat2str(initial_conditions(2, 1))));

subplot(4, 1, 3);
stem(x_label, y(3, :));
title(cstrcat("@ y(-1)= ", mat2str(initial_conditions(3, 2)), " and y(-2)= ",
              mat2str(initial_conditions(3, 1))));

subplot(4, 1, 4);
stem(x_label, y(4, :));
title(cstrcat("@ y(-1)= ", mat2str(initial_conditions(4, 2)), " and y(-2)= ",
              mat2str(initial_conditions(4, 1))));

