function [Q]= Geometrie_inversa_simbolic(Pe)
%Marimi brate 
l1 = 0.2;
l2 = 0.15;
l3 = 0.3;
l4 = 0.2;

q1=0.1;
q2=0.1;
q3=pi/2;

n = 100;                % Numărul de pași pentru iterație.
alpha = 0.2;            % Mărimea pașilor de iterație.
epsilon = 10^-3;        % Precizia pentru a opri iterația când eroarea este suficient de mică

Q =  [q1;q2;q3;1];           
P0 = [0; 0; 0; 1];


for i=1:n
     J=[ 1, 0, l4*(-sin(q3)/5),0;
         0, 1, l4*(cos(q3)/5),0;
         0, 0, l4*(-sin(q3)),0;
         0, 0, l4*(cos(q3)),1;];

     T10 = [1, 0, 0, q1+l1;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
    p0 = T10*P0;
   
  
    
    T21 = [1, 0, 0, 0;...
           0, 1, 0, q2+l2;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
    p1 = T10*T21*P0;
  
    
   T32 = [cos(q3), 0, -sin(q3), l3;...
           0, 1, 0, 0;...
           sin(q3), 0, cos(q3), 0;...
           0, 0, 0, 1;];
    p2 = T10*T21*T32*P0;
  
    
     Te3 = [1, 0, 0, l4;...
           0, 1, 0, 0;...
           0, 0, 1, 0;...
           0, 0, 0, 1;];
    p3 = T10*T21*T32*Te3*P0;
   
    P = Pe - (T10*T21*T32*Te3*P0);

    cla
    
    pause(0.1);
    
      if abs(P) < epsilon
        break
      end
    Q = Q + alpha*transpose(J)*inv(J*transpose(J))*P;
    q1 = Q(1);
    q2 = Q(2);
    q3 = Q(3);
end
    P = Pe - (T10*T21*T32*Te3*P0);
    P1 = T10*P0;
    P2 = T10*T21*P0;
    P3=T10*T21*T32*P0;
    Pe=T10*T21*T32*Te3*P0;
   
    
    
    disp('P1=')
    disp(P1)
    disp('P2=')
    disp(P2)
end