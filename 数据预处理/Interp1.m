clc,clear

%plot(x, y, '*', xi, yi,'LineWidth', 2)

x0 = [0 3 5 7 9 11 12 13 14 15];
y0 = [0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6];
x = 0:0.1:15;

y1 = lagrange(x0, y0, x);
y2 = interp1(x0, y0, x);
y3 = interp1(x0, y0, x,'spline');


% 绘制拉格朗日插值结果
subplot(3,1,1);
plot(x0, y0, 'k+', x, y1, 'r');
grid;
title('lagrange');

% 绘制分段线性插值结果
subplot(3,1,2);
plot(x0, y0, 'k+', x, y2, 'r');
grid;
title('piecewise linear');

% 绘制三次样条插值结果
subplot(3,1,3);
plot(x0, y0, 'k+', x, y3, 'r');
grid;
title('spline');
