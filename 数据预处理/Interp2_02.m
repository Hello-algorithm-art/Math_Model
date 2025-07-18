%二维散乱点插值
clear
x=[129 140 103.5 88 185.5 195 105.5 157.5 107.5 77 81 162 162 117.5];
y=[7.5 141.5 23 147 22.5 137.5 85.5 -6.5 -81 3 56.5 -66.5 84 -33.5];
z=[-4 -8 -6 -8 -6 -8 -8 -9 -9 -8 -8 -9 -4 -9];
[xi,yi]=meshgrid(75:0.5:200,-70:0.5:150);
zi=griddata(x,y,z,xi,yi,'cubic');

figure(1);
meshz(xi,yi,zi);
xlabel('X'),ylabel('Y'),zlabel('Z');

figure(2);
contour(xi,yi,zi,[-5 -5], 'b');
grid;
hold on;
plot(x,y,'+');
xlabel('X'),ylabel('Y');