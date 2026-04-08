function Calcul_Jacobian()
syms u;

syms l1 l2 l3;
syms q1 q2 q3;

 T10 = [1, 0, 0, L;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
    
    T21 = [1, 0, 0, l1;...
           0, 1, 0, q2;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
 
    
    T32 = [cos(q3), -sin(q3), 0, 0;...
           sin(q3), cos(q3), 0, l2;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];

    Te3 = [1, 0, 0, l3;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
 

%Inmultirea originii robotului cu matricile de transformare
%T=inmultirea tuturor matricilor de transformare
T = T10;
T = T*T21;
T = T*T32;
T= T*Te3;

J=[ 0 ,  - l3*(cos(q2)*cos(q3) - sin(q2)*sin(q3)) - l2*cos(q2) ,  -l3*(cos(q2)*cos(q3) - sin(q2)*sin(q3));
    0 ,  - l3*(cos(q2)*sin(q3) + cos(q3)*sin(q2)) - l2*sin(q2) ,  -l3*(cos(q2)*sin(q3) + cos(q3)*sin(q2));
    1 ,                             0                          ,                  0;]
diff(T(1:3,4),L)
diff(T(1:3,4),q2)
diff(T(1:3,4),q3)
J 
pinv(J)

end