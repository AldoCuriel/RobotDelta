close all
clear al

offset = 1;
puntoMayor = 3;
% Area de Tabajo 4 Puntos

pointA = [1,1,0];
pointB = [-1,1,0];
pointC = [-1,-1,0];
pointD = [1,-1,0];

x1 = -5
y1 = 3
z1 = .5

x2 = 5
y2 = 0
z2 = 1

if z1 >= offset && z2 >= offset
    a = linspace(x1,x2);
    a1 = linspace(y1,y2);
    a2 = linspace(z1,z2);
    ruta = [a;a1;a2];
    
    figure
    plot3(x1,y1,z1,'*b')
    hold on
    plot3(x2,y2,z2,'*m')
    hold on
elseif z1 >= offset
    x2of = x2
    y2of = y2
    z2of = z2+offset
    a = linspace(x1,x2of);
    a1 = linspace(y1,y2of);
    a2 = linspace(z1,z2of);
    d = linspace(x2of,x2);
    d1 = linspace(y2of,y2);
    d2 = linspace(z2of,z2);
    ruta = [a d;a1 d1;a2 d2];
    
    figure
    plot3(x1,y1,z1,'*b')
    hold on
    plot3(x2,y2,z2,'*m')
    hold on
    plot3(x2of,y2of,z2of,'*r')
    hold on
elseif z2 >= offset
    x1of = x1
    y1of = y1
    z1of = z1+offset
    a = linspace(x1,x1of);
    a1 = linspace(y1,y1of);
    a2 = linspace(z1,z1of);
    d = linspace(x1of,x2);
    d1 = linspace(y1of,y2);
    d2 = linspace(z1of,z2);
    ruta = [a d;a1 d1;a2 d2];
    
    figure
    plot3(x1,y1,z1,'*b')
    hold on
    plot3(x2,y2,z2,'*m')
    hold on
    plot3(x1of,y1of,z1of,'*r')
    hold on
else
    x1of = x1
    y1of = y1
    z1of = z1+offset

    x2of = x2
    y2of = y2
    z2of = z2+offset

    k = midpoint(1,[x1 x2;y1 y2])
    xm=k(1)
    ym=k(2)
    zm=z1+puntoMayor

    a = linspace(x1,x1of);
    a1 = linspace(y1,y1of);
    a2 = linspace(z1,z1of);

    b = linspace(x1of,xm);
    b1 = linspace(y1of,ym);
    b2 = linspace(z1of,zm);

    c = linspace(xm,x2of);
    c1 = linspace(ym,y2of);
    c2 = linspace(zm,z2of);

    d = linspace(x2of,x2);
    d1 = linspace(y2of,y2);
    d2 = linspace(z2of,z2);

    ruta = [a b c d;a1 b1 c1 d1;a2 b2 c2 d2];
    figure
    plot3(x1,y1,z1,'*b')
    hold on
    plot3(x1of,y1of,z1of,'*c')
    hold on
    plot3(xm,ym,zm,'*g')
    hold on
    plot3(x2of,y2of,z2of,'*r')
    hold on
    plot3(x2,y2,z2,'*m')
    hold on
end


plot3(ruta(1,:,:),ruta(2,:,:),ruta(3,:,:),'k')
hold on
points=[pointA; pointB; pointC; pointD;];
fill3(points(:,1),points(:,2),points(:,3),'r')
ylabel('Y')
xlabel('X')
zlabel('Z')
grid on
alpha(0.3)


