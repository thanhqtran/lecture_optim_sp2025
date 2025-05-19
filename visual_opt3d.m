% Define the grid
[x, y] = meshgrid(-5:0.01:5, -5:0.01:5);
 
% Objective function
f = x.^2 + y.^2;
c = -2;
% Define the constraint line: x + y + 3 = 0 => y = -x - 3
x_constr = -5:0.01:5;
y_constr = -x_constr +c;
z_constr = x_constr.^2 + y_constr.^2;
 
figure;
% Plot the surface
surf(x, y, f, 'EdgeColor', 'none');
hold on;
% Add contour lines on the base (z = 0)
contour3(x, y, f, 32, 'k'); % 32 contour levels, black lines
% Plot the constraint curve on the surface
plot3(x_constr, y_constr, z_constr, 'r', 'LineWidth', 3);
% Plot the constraint plane
cp = constantplane([1 1 0], c);
 
 
% Plot the unconstrained minimum point (0,0)
plot3(0, 0, 0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
text(1, 1, 1, 'Uncons. Min', 'Color', 'r');
 
% Plot the constrained minimum point (-1.5, -1.5)
xmin = -1;
ymin = -1;
f_min_constr = (xmin)^2 + (ymin)^2;
plot3(xmin, ymin, f_min_constr, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
text(-3, -3, f_min_constr + 1, 'Const. Min', 'Color', 'g');
 
% Colormap with fewer levels
colormap(jet(32)); % 16 color levels
colorbar;
 
% Labels and view
xlabel('x');
ylabel('y');
zlabel('f(x, y) = x^2 + y^2');
title('Minimize x^2 + y^2 subject to x + y + 2 = 0');
view(45, 30);
grid on;
