function PlotRobotDelta(LadoDelTrianguloSuperior,CentroTriangulo,LadoDelTrianguloInferior,xEfectorFinal, yEfectorFinal,zEfectorFinal)
global ruta;
% plot3(x,y,z,Extras);
[a b c L l EspacioTrabajo Sp Sb] = definicion_robot;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Triangulo Superior

LadoDelTrianguloSuperior = Sb;
CentroTriangulo = [0 0 1];
AltruaTringuloSuperior = sind(60)*LadoDelTrianguloSuperior;

%basePrueba = cosd(60)*LadoDelTriangulo
%C = sqrt(AltruaTringuloSuperior^2 + basePrueba^2)


plot3(CentroTriangulo(1),CentroTriangulo(2),CentroTriangulo(3),'-g*','LineWidth',4)
ylabel('Y')
xlabel('X')
zlabel('Z')
grid on
hold on

PuntasTrianguloX = [CentroTriangulo(1),...
    -LadoDelTrianguloSuperior/2,...
    LadoDelTrianguloSuperior/2,...
    CentroTriangulo(1)];
PuntasTrianguloY = [(CentroTriangulo(2)+(AltruaTringuloSuperior/2)),...
    (CentroTriangulo(2)-(AltruaTringuloSuperior/2)),...
    (CentroTriangulo(2)-(AltruaTringuloSuperior/2)),...
    (CentroTriangulo(2)+(AltruaTringuloSuperior/2))];
PuntasTrianguloZ = [CentroTriangulo(3),...
    CentroTriangulo(3),...
    CentroTriangulo(3),...
    CentroTriangulo(3)];

plot3(PuntasTrianguloX,PuntasTrianguloY,PuntasTrianguloZ,'-r*','LineWidth',4)
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Triangulo Inferior

LadoDelTrianguloInferior = Sp;
% 
% xEfectorFinal = 0;
% yEfectorFinal = 0;
% zEfectorFinal = 1;

%CentroTrianguloInferior = [yEfectorFinal xEfectorFinal zEfectorFinal];
AltruaTringuloInferior = sind(60)*LadoDelTrianguloInferior;

plot3(xEfectorFinal,yEfectorFinal,zEfectorFinal,'-y*','LineWidth',4)
hold on

PuntasTrianguloXinferior = [xEfectorFinal,...
    xEfectorFinal-LadoDelTrianguloInferior/2,...
    xEfectorFinal+LadoDelTrianguloInferior/2,...
    xEfectorFinal];

PuntasTrianguloYinferior = [(yEfectorFinal-(AltruaTringuloInferior/2)),...
    (yEfectorFinal+(AltruaTringuloInferior/2)),...
    (yEfectorFinal+(AltruaTringuloInferior/2)),...
    (yEfectorFinal-(AltruaTringuloInferior/2))];

PuntasTrianguloZinferior = [zEfectorFinal,...
    zEfectorFinal,...
    zEfectorFinal,...
    zEfectorFinal];

plot3(PuntasTrianguloXinferior,PuntasTrianguloYinferior,PuntasTrianguloZinferior,'-k*','LineWidth',2)
hold on
fill3(EspacioTrabajo(:,1),EspacioTrabajo(:,2),EspacioTrabajo(:,3),'r')
alpha(0.3)
plot3(ruta(1,:,:),ruta(2,:,:),ruta(3,:,:),'b','LineWidth',2)
%axis([-.2 .2 -.2 .2 -1 10])
hold off
end
