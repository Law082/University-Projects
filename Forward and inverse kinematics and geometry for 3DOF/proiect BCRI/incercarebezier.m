% Number of control points
n = 5;

% Control points (modify these as needed)
controlPoints = [0 1 1; 1 2 2; 2 3 3;3 4 4;4 5 5];

% Time parameter for the Bezier curve (adjust as needed)
t = linspace(0, 1, 100);

% Compute Bezier curve using De Casteljau's algorithm
B = zeros(length(t), 3);
for i = 1:length(t)
    P = controlPoints;
    while size(P, 1) > 1
        P = P(1:end-1, :) + t(i) * diff(P);
    end
    B(i, :) = P;
end

% Plot the 3D Bezier curve
figure;
plot3(B(:, 1), B(:, 2), B(:, 3), 'y-', 'LineWidth', 2);
hold on;

% Plot the control points
plot3(controlPoints(:, 1), controlPoints(:, 2), controlPoints(:, 3), 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Set axis limits
axis equal;

% Title and labels
xlabel('X');
ylabel('Y');
zlabel('Z');

% Display legend
legend('incercarebezier', 'Puncte');
