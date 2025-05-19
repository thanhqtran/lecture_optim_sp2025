% Define the grid
x = linspace(-3,3,1000);
y = linspace(-3,3,1000);
[X, Y] = meshgrid(x, y);
c = -2;
 
% Objective function
Z = X.^2 + Y.^2;
y_func = c - x;
 
% Plot contour
figure;
contour(x,y,Z);
hold on;
plot(x, y_func, 'red');
xline(0);
yline(0);
xlabel("x");
ylabel("y");
% circle at (-1,-1)
plot(-1, -1, 'ro', 'LineWidth', 2, 'MarkerSize', 8);
 
% Add gradient vectors at sample points
[xq, yq] = meshgrid(-3:1:3, -3:1:3);  % Coarser grid for clarity
u = 2*xq;  % dx component of gradient
v = 2*yq;  % dy component of gradient
quiver(xq, yq, u, v, 'k', 'LineWidth', 0.8, 'MaxHeadSize', 0.5, ...
    'AutoScale', 'on', 'AutoScaleFactor', 1.1);
 
% Gradient of constraint g(x,y) = x + y + 3 --> grad = [1, 1]
% Pick points on the constraint line to show grad g
xg = -3:1:3;
yg = c - xg;
u_g = ones(size(xg));  % dx component of grad g
v_g = ones(size(yg));  % dy component of grad g
quiver(xg, yg, u_g, v_g, 'b', ...
    'LineWidth', 0.8, 'MaxHeadSize', 0.5, ...
    'AutoScale', 'on', 'AutoScaleFactor', 0.2); % Gradient of g
 
 
title('Contour of f(x,y) = x^2 + y^2 with Gradient Vectors');
axis equal;
