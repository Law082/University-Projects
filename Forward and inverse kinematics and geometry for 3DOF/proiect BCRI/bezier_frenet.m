function bezier_frenet(theta1,theta2,theta3)
    theta1=pi/2;
    theta2=pi/2;
    theta3=pi/2;
    % Definirea unghiurilor de rotație pentru cele trei cuple de rotație
    theta1 = linspace(0, theta1, 5);  % Unghiuri pentru primul element
    theta2 = linspace(0, theta2, 5);    % Unghiuri pentru al doilea element
    theta3 = linspace(0, theta3, 5);  % Unghiuri pentru al treilea element
    
    % Calculul coordonatelor pentru fiecare punct de control
    x = cos(theta1) .* cos(theta2) .* cos(theta3);
    y = sin(theta1) .* cos(theta2) .* cos(theta3);
    z = sin(theta3);
    % Calculul derivatelor de ordinul întâi și al doilea ale curbei Bezier
    dx = gradient(x);
    dy = gradient(y);
    dz = gradient(z);
    ddx = gradient(dx);
    ddy = gradient(dy);
    ddz = gradient(dz);
    
    % Normalizarea vectorilor tangentă, normală și binormală
    T = normalize([dx', dy', dz']);
    N = normalize([ddx', ddy', ddz']);
    B = cross(T, N);
    
    % Afișarea rezultatului
    figure;
    plot3(x, y, z, 'y-', 'LineWidth', 2);
    hold on;
    quiver3(x', y', z', T(:,1), T(:,2), T(:,3), 0.2, 'r', 'LineWidth', 1.5);
    quiver3(x', y', z', N(:,1), N(:,2), N(:,3), 0.2, 'g', 'LineWidth', 1.5);
    quiver3(x', y', z', B(:,1), B(:,2), B(:,3), 0.2, 'b', 'LineWidth', 1.5);
    scatter3(x, y, z, 'k', 'filled');
    grid on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('Curba Bezier cu Reper Frenet');
end