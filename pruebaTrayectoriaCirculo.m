x=0;
y=0;
r=.2;

L1=5;
L2=4;

th = 0:pi/50:2*pi; %Numero de Pasos
xunit = r * cos(th);
yunit = r * sin(th);
u = length(xunit)
g =  -.3:(.05-(-.3))/(u-1):.05
plot3(xunit,yunit,g)
grid on
