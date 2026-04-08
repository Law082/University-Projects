function [Q]= Geometrie_inversapuma(Pe)
%Animatie Geometrie inversa 
%intrare: pozitia efectorului
%iesire: pozitia c
%Marimi brate 
l1 = 0.4;
l2 = 0.3;
l3 = 0.2;

q1=90;
q2=30;
q3=15;

n = 30;                % Numărul de pași pentru iterație.
alpha = 0.2;            % Mărimea pașilor de iterație.
epsilon = 10^-3;        % Precizia pentru a opri iterația când eroarea este suficient de mică

Q =  [q1;q2;q3;1];           
P0 = [0; 0; 0; 1];


figure
for i=1:n
     J=  [(pi*sin((pi*q1)/180)*sin((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q2)/180)*cos((pi*q3)/180)*sin((pi*q1)/180))/900 - (pi*cos((pi*q2)/180)*sin((pi*q1)/180))/600, - (pi*cos((pi*q1)/180)*sin((pi*q2)/180))/600 - (pi*cos((pi*q1)/180)*cos((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q1)/180)*cos((pi*q3)/180)*sin((pi*q2)/180))/900, - (pi*cos((pi*q1)/180)*cos((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q1)/180)*cos((pi*q3)/180)*sin((pi*q2)/180))/900,0;
         (pi*cos((pi*q1)/180)*cos((pi*q2)/180))/600 + (pi*cos((pi*q1)/180)*cos((pi*q2)/180)*cos((pi*q3)/180))/900 - (pi*cos((pi*q1)/180)*sin((pi*q2)/180)*sin((pi*q3)/180))/900, - (pi*sin((pi*q1)/180)*sin((pi*q2)/180))/600 - (pi*cos((pi*q2)/180)*sin((pi*q1)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q3)/180)*sin((pi*q1)/180)*sin((pi*q2)/180))/900, - (pi*cos((pi*q2)/180)*sin((pi*q1)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q3)/180)*sin((pi*q1)/180)*sin((pi*q2)/180))/900,0;
                                                                                                                                                                              0,                                                      (pi*sin((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q2)/180)*cos((pi*q3)/180))/900 - (pi*cos((pi*q2)/180))/600,                                     (pi*sin((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q2)/180)*cos((pi*q3)/180))/900,0;
                                                                                                                                                                             0,                                                                                                                                                        -sin((pi*q1)/180),                                                                                                           -sin((pi*q1)/180),1;];

    T10 =     [cosd(q1), -sind(q1), 0, 0;...
           sind(q1), cosd(q1), 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
 p0 = T10*P0;


T21 =     [cosd(q2), 0, sind(q2), 0;...
           0, 1, 0, 0;...
           -sind(q2), 0, cosd(q2), l1;...
           0, 0, 0, 1;];
 p1 = T10*T21*P0;



T32 =      [cosd(q3), 0, sind(q3), l2;...
           0, 1, 0, 0;...
           -sind(q3), 0, cosd(q3), 0;...
           0, 0, 0, 1;];

  p2 = T10*T21*T32*P0;

 Te3 =    [1, 0, 0, l3;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
   p3 = T10*T21*T32*Te3*P0;
   
    P = Pe - (T10*T21*T32*Te3*P0);

    cla



    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă

    quiver3(p1(1), p1(2), p1(3), T21(1,1), T21(2,1), T21(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1,2), T21(2,2), T21(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1,3), T21(2,3), T21(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă

    quiver3(p2(1), p2(2), p2(3), T32(1,1), T32(2,1), T32(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1,2), T32(2,2), T32(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1,3), T32(2,3), T32(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă

    quiver3(p3(1), p3(2), p3(3), Te3(1,1), Te3(2,1), Te3(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(p3(1), p3(2), p3(3), Te3(1,2), Te3(2,2), Te3(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(p3(1), p3(2), p3(3), Te3(1,3), Te3(2,3), Te3(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru efector
    %plot3(M(1,:), M(2,:), M(3,:), "Marker","o", 'Color','r');
    line([0,p0(1)],[0,p0(2)],[0,p0(3)],'Color','r', 'LineWidth', 3);
    line([p0(1),p1(1)],[p0(2),p1(2)],[p0(3),p1(3)],'Color','b', 'LineWidth', 3);
    line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)],'Color','g', 'LineWidth', 3);
    line([p2(1),p3(1)],[p2(2),p3(2)],[p2(3),p3(3)], 'Color','g','LineWidth', 3);
    grid on;
    hold on;
    xlim([-1,1]);
    ylim([-1,1]);
    zlim([-1,1]);
    
    pause(0.1);
    
      if abs(P) < epsilon
        break
      end
    Q = Q + alpha*inv(J)*P;
    q1 = Q(1);
    q2 = Q(2);
    q3 = Q(3);
end
    P = Pe - (T10*T21*T32*Te3*P0);
    P1 = T10*P0;
    P2 = T10*T21*P0;
    P3=T10*T21*T32*P0;
    Pe=T10*T21*T32*Te3*P0;

    xlim([-1,1]);
    ylim([-1,1]);
    zlim([-1,1]);



    hold on
    quiver3(p0(1), p0(2), p0(3), T10(1,1), T10(2,1), T10(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1,2), T10(2,2), T10(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(p0(1), p0(2), p0(3), T10(1,3), T10(2,3), T10(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă

    quiver3(p1(1), p1(2), p1(3), T21(1,1), T21(2,1), T21(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1,2), T21(2,2), T21(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(p1(1), p1(2), p1(3), T21(1,3), T21(2,3), T21(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă

    quiver3(p2(1), p2(2), p2(3), T32(1,1), T32(2,1), T32(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1,2), T32(2,2), T32(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(p2(1), p2(2), p2(3), T32(1,3), T32(2,3), T32(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă

    quiver3(p3(1), p3(2), p3(3), Te3(1,1), Te3(2,1), Te3(3,1),0.05, 'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(p3(1), p3(2), p3(3), Te3(1,2), Te3(2,2), Te3(3,2),0.05, 'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(p3(1), p3(2), p3(3), Te3(1,3), Te3(2,3), Te3(3,3),0.05, 'b', 'LineWidth', 1.5); % Axele Z pentru efector
    %plot3(M(1,:), M(2,:), M(3,:), "Marker","o", 'Color','r');
    line([0,p0(1)],[0,p0(2)],[0,p0(3)],'Color','r', 'LineWidth', 3);
    line([p0(1),p1(1)],[p0(2),p1(2)],[p0(3),p1(3)],'Color','b', 'LineWidth', 3);
    line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)],'Color','g', 'LineWidth', 3);
    line([p2(1),p3(1)],[p2(2),p3(2)],[p2(3),p3(3)], 'Color','g','LineWidth', 3);
   

    grid on;
    disp('P1=')
    disp(P1)
    disp('P2=')
    disp(P2)
end