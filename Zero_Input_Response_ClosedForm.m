initial_conditions = [3, 21, 20, 90 ; 2, 17, 13, 40];
A = [2, 10 ; 4, 100];
coefficients = A \ initial_conditions;
powers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
y = zeros(4, 15);

for i=1:4
  for j=1:15

    y(i, j) = (coefficients(1, i) * power(0.5, powers(j))) + (coefficients(2, i) * power(0.1, powers(j)));

  endfor
endfor

subplot(4, 1, 1);
stem(powers, y(1, :));
title(cstrcat("@ coefficients: ", mat2str(coefficients(1, 1)), " and ",
              mat2str(coefficients(2, 1))));

subplot(4, 1, 2);
stem(powers, y(2, :));
title(cstrcat("@ coefficients: ", mat2str(coefficients(1, 2)), " and ",
              mat2str(coefficients(2, 2))));

subplot(4, 1, 3);
stem(powers, y(3, :));
title(cstrcat("@ coefficients: ", mat2str(coefficients(1, 3)), " and ",
              mat2str(coefficients(2, 3))));

subplot(4, 1, 4);
stem(powers, y(4, :));
title(cstrcat("@ coefficients: ", mat2str(coefficients(1, 4)), " and ",
              mat2str(coefficients(2, 4))));

