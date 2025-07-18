%二维插值示例
x = 1:5;
y = 1:3;
temps = [82 81 80 82 84; 
    79 63 61 65 81; 
    84 84 82 85 86];
%temps元素坐标(1,1)->82，(2,1)->81
figure(1);
mesh(x, y, temps);

xi = 1:0.2:5;
yi = 1:0.2:3;

zi = interp2(x, y, temps, xi, yi', 'cubic');

figure(2);
surf(xi, yi, zi);

figure(3);
contour(xi, yi, zi, 20, 'r');

[i, j] = find(zi == min(min(zi)));
x_min = xi(j), y_min = yi(i), z_min = zi(i, j)

[i, j] = find(zi == max(max(zi)));
x_max = xi(j), y_max = yi(i), z_max = zi(i, j)