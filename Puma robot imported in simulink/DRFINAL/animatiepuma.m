function animatiepuma(q1,q2,q3)
    %brate
    l1=0.4;
    l2=0.3;
    l3=0.2;
    
    q1=-90;%rotatie Z
    q2=30;%rotatie Y
    q3=60;%rotatie Y
    
    for Q1=0:1:q1
        q21=0;
        q31=0;

   T01 =     [cosd(Q1), -sind(Q1), 0, 0;...
           sind(Q1), cosd(Q1), 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
   



T12 =     [cosd(q21), 0, sind(q21), 0;...
           0, 1, 0, 0;...
           -sind(q21), 0, cosd(q21), l1;...
           0, 0, 0, 1;];
 


T23 =      [cosd(q31), 0, sind(q31), l2;...
           0, 1, 0, 0;...
           -sind(q31), 0, cosd(q31), 0;...
           0, 0, 0, 1;];



 T3e =    [1, 0, 0, l3;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];

  P0 = [0; 0; 0; 1];
        T = T01;
        P1 = T01*P0;
        T = T*T12;
        P2 = T*P0;
        T = T*T23;
        P3 = T*P0;
        T= T*T3e;
        Pe=T*P0;


    quiver3(P0(1), P0(2), P0(3), T01(1,1), T01(2,1), T01(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,2), T01(2,2), T01(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,3), T01(2,3), T01(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă
    
    quiver3(P1(1), P1(2), P1(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă

    quiver3(P2(1), P2(2), P2(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă
    
    quiver3(P3(1), P3(2), P3(3), T23(1,1), T23(2,1), T23(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,2), T23(2,2), T23(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,3), T23(2,3), T23(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă
    
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,1), T3e(2,1), T3e(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,2), T3e(2,2), T3e(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,3), T3e(2,3), T3e(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru efector

         line([0,P1(1)],[0,P1(2)],[0,P1(3)],'Color','b','LineWidth',4)
         line([P1(1),P2(1)],[P1(2),P2(2)],[P1(3),P2(3)],'Color','b','LineWidth',4)
         line([P2(1),P3(1)],[P2(2),P3(2)],[P2(3),P3(3)],'Color','g','LineWidth',3)
         line([P3(1),Pe(1)],[P3(2),Pe(2)],[P3(3),Pe(3)],'Color','g','LineWidth',3)
         hold on;
         grid on;
         xlim([-1;1]);
         ylim([-1;1]);
         zlim([-1;1]);
         pause(0.05);
         cla
    end

    for Q2=0:1:q2
        q31=0;
    
     T01 =     [cosd(q1), -sind(q1), 0, 0;...
           sind(q1), cosd(q1), 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
 


T12 =     [cosd(Q2), 0, sind(Q2), 0;...
           0, 1, 0, 0;...
           -sind(Q2), 0, cosd(Q2), l1;...
           0, 0, 0, 1;];
 



T23 =      [cosd(q31), 0, sind(q31), l2;...
           0, 1, 0, 0;...
           -sind(q31), 0, cosd(q31), 0;...
           0, 0, 0, 1;];



 T3e =    [1, 0, 0, l3;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];

 P0 = [0; 0; 0; 1];
        T = T01;
        P1 = T01*P0;
        T = T*T12;
        P2 = T*P0;
        T = T*T23;
        P3 = T*P0;
        T= T*T3e;
        Pe=T*P0;

    quiver3(P0(1), P0(2), P0(3), T01(1,1), T01(2,1), T01(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,2), T01(2,2), T01(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,3), T01(2,3), T01(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă
    
    quiver3(P1(1), P1(2), P1(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă

    quiver3(P2(1), P2(2), P2(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă
    
    quiver3(P3(1), P3(2), P3(3), T23(1,1), T23(2,1), T23(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,2), T23(2,2), T23(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,3), T23(2,3), T23(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă
    
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,1), T3e(2,1), T3e(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,2), T3e(2,2), T3e(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,3), T3e(2,3), T3e(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru efector

         line([0,P1(1)],[0,P1(2)],[0,P1(3)],'Color','g','LineWidth',4)
         line([P1(1),P2(1)],[P1(2),P2(2)],[P1(3),P2(3)],'Color','b','LineWidth',4)
         line([P2(1),P3(1)],[P2(2),P3(2)],[P2(3),P3(3)],'Color','g','LineWidth',3)
         line([P3(1),Pe(1)],[P3(2),Pe(2)],[P3(3),Pe(3)],'Color','g','LineWidth',3)
         hold on;
         grid on;
         xlim([-1;1]);
         ylim([-1;1]);
         zlim([-1;1]);
         pause(0.05);
         cla

    end
    for Q3=0:1:q3
      
     T01 =     [cosd(q1), -sind(q1), 0, 0;...
           sind(q1), cosd(q1), 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];



T12 =     [cosd(q2), 0, sind(q2), 0;...
           0, 1, 0, 0;...
           -sind(q2), 0, cosd(q2), l1;...
           0, 0, 0, 1;];
 



T23 =      [cosd(Q3), 0, sind(Q3), l2;...
           0, 1, 0, 0;...
           -sind(Q3), 0, cosd(Q3), 0;...
           0, 0, 0, 1;];

 

 T3e =    [1, 0, 0, l3;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];

  P0 = [0; 0; 0; 1];
        T = T01;
        P1 = T01*P0;
        T = T*T12;
        P2 = T*P0;
        T = T*T23;
        P3 = T*P0;
        T= T*T3e;
        Pe=T*P0;


    quiver3(P0(1), P0(2), P0(3), T01(1,1), T01(2,1), T01(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,2), T01(2,2), T01(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,3), T01(2,3), T01(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă
    
    quiver3(P1(1), P1(2), P1(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă

    quiver3(P2(1), P2(2), P2(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă
    
    quiver3(P3(1), P3(2), P3(3), T23(1,1), T23(2,1), T23(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,2), T23(2,2), T23(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,3), T23(2,3), T23(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă
    
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,1), T3e(2,1), T3e(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,2), T3e(2,2), T3e(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,3), T3e(2,3), T3e(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru efector

         line([0,P1(1)],[0,P1(2)],[0,P1(3)],'Color','g','LineWidth',4)
         line([P1(1),P2(1)],[P1(2),P2(2)],[P1(3),P2(3)],'Color','b','LineWidth',4)
         line([P2(1),P3(1)],[P2(2),P3(2)],[P2(3),P3(3)],'Color','g','LineWidth',3)
         line([P3(1),Pe(1)],[P3(2),Pe(2)],[P3(3),Pe(3)],'Color','g','LineWidth',3)
         hold on;
         grid on;
         xlim([-1;1]);
         ylim([-1;1]);
         zlim([-1;1]);
         pause(0.05);
         cla
    end

    hold on
    quiver3(P0(1), P0(2), P0(3), T01(1,1), T01(2,1), T01(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,2), T01(2,2), T01(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru prima cuplă
    quiver3(P0(1), P0(2), P0(3), T01(1,3), T01(2,3), T01(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru prima cuplă
    
    quiver3(P1(1), P1(2), P1(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P1(1), P1(2), P1(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă

    quiver3(P2(1), P2(2), P2(3), T12(1,1), T12(2,1), T12(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,2), T12(2,2), T12(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a doua cuplă
    quiver3(P2(1), P2(2), P2(3), T12(1,3), T12(2,3), T12(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a doua cuplă
    
    quiver3(P3(1), P3(2), P3(3), T23(1,1), T23(2,1), T23(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,2), T23(2,2), T23(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru a treia cuplă
    quiver3(P3(1), P3(2), P3(3), T23(1,3), T23(2,3), T23(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru a treia cuplă
    
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,1), T3e(2,1), T3e(3,1),0.05,'r', 'LineWidth', 1.5); % Axele X pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,2), T3e(2,2), T3e(3,2),0.05,'g', 'LineWidth', 1.5); % Axele Y pentru efector
    quiver3(Pe(1), Pe(2), Pe(3), T3e(1,3), T3e(2,3), T3e(3,3),0.05,'b', 'LineWidth', 1.5); % Axele Z pentru efector
    
         line([0,P1(1)],[0,P1(2)],[0,P1(3)],'Color','g','LineWidth',4)
         line([P1(1),P2(1)],[P1(2),P2(2)],[P1(3),P2(3)],'Color','b','LineWidth',4)
         line([P2(1),P3(1)],[P2(2),P3(2)],[P2(3),P3(3)],'Color','g','LineWidth',3)
         line([P3(1),Pe(1)],[P3(2),Pe(2)],[P3(3),Pe(3)],'Color','g','LineWidth',3)

end
