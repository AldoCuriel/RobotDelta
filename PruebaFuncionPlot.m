close all


LadoDelTrianguloSuperior = 3;
x = 0;
y = 0;
z = 10;
CentroTriangulo = [x y z];

LadoDelTrianguloInferior = 1;
 
xEfectorFinal = 2;
yEfectorFinal = 5;
zEfectorFinal = 1;

PlotRobotDelta(LadoDelTrianguloSuperior,CentroTriangulo,LadoDelTrianguloInferior,xEfectorFinal, yEfectorFinal,zEfectorFinal)

% PlotRobotDelta(3,[0 0 10],1,2, 5,1)