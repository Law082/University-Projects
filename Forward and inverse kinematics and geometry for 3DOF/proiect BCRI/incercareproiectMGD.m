function incercareproiectMGD(q1,q2,q3)
    figure
    l1 = 0.2;
    l2 = 0.15;
    l3 = 0.3;
    l4 = 0.2;
    P0 = [0; 0; 0; 1];

    T10 = [1, 0, 0, q1 + l1;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];

    T21 = [1, 0, 0, 0;...
           0, 1, 0, q2 + l2;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];

    T32 = [cos(q3), 0, -sin(q3), l3;...
           0, 1, 0, 0;...
           sin(q3), 0, cos(q3), 0;...
           0, 0, 0, 1;];

    Te3 = [1, 0, 0, l4;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];

    p0 = T10 * P0;
    p1 = T10 * T21 * P0;
    p2 = T10 * T21 * T32 * P0;
    p3 = T10 * T21 * T32 * Te3 * P0;
    
    
    quiver3(p0(1), p0(2), p0(3), T10(1, 1), T10(2, 1), T10(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1, 2), T10(2, 2), T10(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1, 3), T10(2, 3), T10(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă
    hold on
    quiver3(p1(1), p1(2), p1(3), T21(1, 1), T21(2, 1), T21(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1, 2), T21(2, 2), T21(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1, 3), T21(2, 3), T21(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă
    hold on
    quiver3(p2(1), p2(2), p2(3), T32(1, 1), T32(2, 1), T32(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1, 2), T32(2, 2), T32(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1, 3), T32(2, 3), T32(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă
    hold on
    quiver3(p3(1), p3(2), p3(3), Te3(1, 1), Te3(2, 1), Te3(3, 1), 0.05, 'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(p3(1), p3(2), p3(3), Te3(1, 2), Te3(2, 2), Te3(3, 2), 0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(p3(1), p3(2), p3(3), Te3(1, 3), Te3(2, 3), Te3(3, 3), 0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru efector
    hold on
    line([0, p0(1)], [0, p0(2)], [0, p0(3)], 'Color', 'r', 'LineWidth', 3);
    line([p0(1), p1(1)], [p0(2), p1(2)], [p0(3), p1(3)], 'Color', 'b', 'LineWidth', 3);
    line([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'Color', 'g', 'LineWidth', 3);
    line([p2(1), p3(1)], [p2(2), p3(2)], [p2(3), p3(3)], 'LineWidth', 3);

    grid on;
        
    xlim([-1, 1]);
    ylim([-1, 1]);
    zlim([-1, 1]);
    disp('p3=')
    disp(p3)
end
