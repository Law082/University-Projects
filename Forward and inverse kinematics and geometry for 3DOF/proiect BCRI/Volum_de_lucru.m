function Volum_de_lucru() 
figure
E = [];
for  i=0:0.025:0.20                    %translatie pe x
    for j=0:0.025:0.20                 %translatie pe y
        for k=0:5:270                  %rotatie pe z
              [punct]= geometrie_directa_volum(i,j,k);
            E=[E,punct];
        end
    end
end
plot3(E(1,:),E(2,:),E(3,:));

xlim([-1;1]);
ylim([-1;1]);
zlim([-1;1]);
end