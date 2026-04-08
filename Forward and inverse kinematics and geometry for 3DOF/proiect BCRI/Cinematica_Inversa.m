function [viteza_generalizata]=Cinematica_Inversa(Q,viteza)
%dimensiuni brate
l4 = 0.3;

viteza_generalizata=[];

for i=1:length(viteza)
J=[   1, 0, l4*(-sin(Q(3,i)/5));
         0, 1, l4*(cos(Q(3,i)/5));
         0, 0, l4*(-sin(Q(3,i)));];
JP=transpose(J)*inv(J*transpose(J));
viteza_generalizata=[viteza_generalizata,JP*viteza(:,i)];

end

end