function Volum_de_lucrupuma() 
figure
E = [];
for  i=0:5:270                   
    for j=0:5:270                
        for k=0:5:270                  
              [punct]= geometrie_directa_volumpuma(i,j,k);
            E=[E,punct];
        end
    end
end
plot3(E(1,:),E(2,:),E(3,:));

xlim([-1;1]);
ylim([-1;1]);
zlim([-1;1]);
end