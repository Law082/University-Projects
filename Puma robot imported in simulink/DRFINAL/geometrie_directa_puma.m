function [punct]= geometrie_directa_puma(q1,q2,q3)
%intrare:variabile din cuple
%iesire:vectorul de pozitie al efectorului
%q1=-90;%rotatie Z
%q2=30;%rotatie Y
%q3=60;%rotatie Y


l1 = 0.4;
l2 = 0.3;
l3 = 0.2;
P0 = [0; 0; 0; 1];


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
 punct = T10*T21*T32*Te3*P0;
  disp('T10=')
  disp(T10)
  disp('T21=')
  disp(T21)
  disp('T32=')
  disp(T32)
  disp('Te3=')
  disp(Te3)
end