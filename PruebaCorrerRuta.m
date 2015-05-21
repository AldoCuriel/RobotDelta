clear all
close all
clc
j = 50 %Numero de Pasos
r=.1;
th = 0:pi/j:2*pi; 
% xunit = r * cos(th);
% yunit = r * sin(th);
xunit = r * sin(th);
yunit = r * sin(2*th);
u = length(xunit);
% g = ones(1,u);
% g = g*(-.35);
g =(r*sin(3*th))-.1;
ruta = [xunit;yunit;g];

loopRuta = length(ruta(1,:,:))
figure
for i = 1 : loopRuta
%end
x1 = ruta(1,i);
y1 = ruta(2,i);
z1 = ruta(3,i);

[t1 t2 t3] = CalculoAngulos(x1,y1,z1)
[pwmT1 pwmT2 pwmT3] = convertirAngulosPwm(t1,t2,t3)
pwmT1=round(pwmT1)
pwmT2=round(pwmT2)
pwmT3=round(pwmT3)

if pwmT1 > 180 || pwmT2 >180 || pwmT3 > 180
    break
end
if pwmT1 < 0 || pwmT2 < 0 || pwmT3 < 0
    break
end

plot3(xunit,yunit,g)
grid on
ylabel('Y')
xlabel('X')
zlabel('Z')
hold on
plot3(x1,y1,z1,'*r')
hold off
pause(.1)
end