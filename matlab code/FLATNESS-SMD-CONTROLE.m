clear all
close all
clc
xi=0;xf=5;yi=0;yf=0.01;x=0;y=0;v=0.15;T=10;l=0.1;omega=0;
nu=1;h=0.01;theta=pi/2;phi=0;k1=0.25;k2=1;
t=0:0.01:20;

g=9.81 
x=0;y=0;z=0;T=10;u1p=0;xp=0;yp=0;zp=0;thetap=0;phip=0,u1=g*0.425;u2=0;u3=0;Iy=0.002985236;Ix=0.002237568;m=0.425;
Te=0.01;theta=0;phi=0;k11=0;k12=0;k21=0;k22=0;k23=0;k24=0;k31=0;k32=0;k33=0;k34=0;tf=10;

t=0:Te:T;

Px0=0 ; Px1=0 ; Px2=0 ; Px3=1 ; Px4= 0 ; Px5=11.6532 ; Px6= 7.0979 ; Px7=-6.3543 ; Px8= 8.0 ; Px9= 9 ; Px10= 9.0000 ; Px11= 9.0000 ; 
Py0=0; Py1=0; Py2=0; Py3=0; Py4=-5; Py5=5.2719; Py6=2.5352; Py7=7.2342; Py8=7; Py9=7; Py10=7; Py11= 7;

       
xd=(1-(t/tf)).^11*Px0+11*(t/tf).*(1-(t/tf)).^10*Px1+55*(t/tf).^2.*(1-(t/tf)).^9*Px2+165*(t/tf).^3.*(1-(t/tf)).^8*Px3+330*(t/tf).^4.*(1-(t/tf)).^7*Px4+...
    462*(t/tf).^5.*(1-(t/tf)).^6*Px5+462*(t/tf).^6.*(1-(t/tf)).^5*Px6+330*(t/tf).^7.*(1-(t/tf)).^4*Px7+...
    165*(t/tf).^8.*(1-(t/tf)).^3*Px8+55*(t/tf).^9.*(1-(t/tf)).^2*Px9+11*(t/tf).^10.*(1-(t/tf))*Px10+(t/tf).^11*Px11;

xdp=(11*Px11*t.^10)./tf.^11-(11*Px10*t.^10)./tf.^11-(11*Px0*(t/tf - 1).^10)./tf + (11*Px1*(t/tf - 1).^10)./tf +(110*Px1*t.*(t./tf-1).^9)./tf.^2 -...
 (110*Px2*t.*(t./tf - 1).^9)./tf.^2 +(110*Px9*t.^9.*(t./tf - 1))./tf.^10 - (110*Px10*t.^9.*(t./tf - 1))./tf.^10 - (495*Px2*t.^2.*(t./tf - 1).^8)./tf.^3 +...
 (495*Px3*t.^2.*(t./tf - 1).^8)./tf.^3 +(1320*Px3*t.^3.*(t./tf-1).^7)./tf.^4 - (1320*Px4*t.^3.*(t./tf - 1).^7)./tf.^4 -...
 (2310*Px4*t.^4.*(t./tf - 1).^6)./tf.^5 + (2310*Px5*t.^4.*(t./tf - 1).^6)./tf.^5 +(2772*Px5*t.^5.*(t./tf - 1).^5)./tf.^6 - ...
(2772*Px6*t.^5.*(t./tf - 1).^5)./tf.^6 - (2310*Px6*t.^6.*(t./tf -1).^4)./tf.^7 + (2310*Px7*t.^6.*(t./tf - 1).^4)./tf.^7 +...
(1320*Px7*t.^7.*(t./tf -1).^3)./tf.^8 - (1320*Px8*t.^7.*(t./tf - 1).^3)./tf.^8 -(495*Px8*t.^8.*(t./tf - 1).^2)./tf.^9 +(495*Px9*t.^8.*(t./tf -1).^2)./tf.^9;

xdpp=(110*Px9*t.^9)./tf.^11 - (220*Px10*t.^9)./tf.^11 + (110*Px11*t.^9)./tf.^11 - (110*Px0*(t./tf - 1).^9)/tf.^2 + ...
(220*Px1*(t./tf - 1).^9)/tf.^2 - (110*Px2*(t./tf - 1).^9)/tf.^2 + (990*Px1*t.*(t./tf - 1).^8)/tf.^3 - (1980*Px2*t.*(t./tf - 1).^8)/tf.^3 + ...
(990*Px3*t.*(t./tf - 1).^8)./tf.^3 - (990*Px8*t.^8.*(t./tf - 1))./tf.^10 + (1980*Px9*t.^8.*(t./tf - 1))./tf.^10 - (990*Px10*t.^8.*(t./tf - 1))./tf.^10- ...
(3960*Px2*t.^2.*(t./tf - 1).^7)./tf.^4 + (7920*Px3*t.^2.*(t./tf - 1).^7)./tf.^4 + (9240*Px3*t.^3.*(t./tf - 1).^6)./tf.^5 - ...
(3960*Px4*t.^2.*(t./tf - 1).^7)./tf.^4 -(18480*Px4*t.^3.*(t./tf - 1).^6)./tf.^5 - (13860*Px4*t.^4.*(t./tf -1).^5)./tf.^6 + ...
(9240*Px5*t.^3.*(t./tf - 1).^6)./tf.^5 + (27720*Px5*t.^4.*(t./tf - 1).^5)./tf.^6 +(13860*Px5*t.^5.*(t./tf - 1).^4)./tf.^7 -...
(13860*Px6*t.^4.*(t./tf - 1).^5)./tf.^6 -(27720*Px6*t.^5.*(t./tf - 1).^4)./tf.^7 - (9240*Px6*t.^6.*(t./tf - 1).^3)./tf.^8 +...
(13860*Px7*t.^5.*(t./tf - 1).^4)./tf.^7 +(18480*Px7*t.^6.*(t./tf - 1).^3)./tf.^8 + (3960*Px7*t.^7.*(t./tf - 1).^2)./tf.^9 -...
(9240*Px8*t.^6.*(t./tf - 1).^3)./tf.^8 -(7920*Px8*t.^7.*(t./tf - 1).^2)./tf.^9 +(3960*Px9*t.^7.*(t./tf - 1).^2)./tf.^9;


    

yd=(1-(t/tf)).^11*Py0+11*(t/tf).*(1-(t/tf)).^10*Py1+55*(t/tf).^2.*(1-(t/tf)).^9*Py2+165*(t/tf).^3.*(1-(t/tf)).^8*Py3+330*(t/tf).^4.*(1-(t/tf)).^7*Py4+...
    462*(t/tf).^5.*(1-(t/tf)).^6*Py5+462*(t/tf).^6.*(1-(t/tf)).^5*Py6+330*(t/tf).^7.*(1-(t/tf)).^4*Py7+...
    165*(t/tf).^8.*(1-(t/tf)).^3*Py8+55*(t/tf).^9.*(1-(t/tf)).^2*Py9+11*(t/tf).^10.*(1-(t/tf))*Py10+(t/tf).^11*Py11;

ydp=(11*Py11*t.^10)./tf.^11-(11*Py10*t.^10)./tf.^11-(11*Py0*(t/tf - 1).^10)./tf +(11*Py1*(t/tf - 1).^10)./tf +(110*Py1*t.*(t./tf-1).^9)./tf.^2 -...
 (110*Py2*t.*(t./tf - 1).^9)./tf.^2 +(110*Py9*t.^9.*(t./tf - 1))./tf.^10 - (110*Py10*t.^9.*(t./tf - 1))./tf.^10 - (495*Py2*t.^2.*(t./tf - 1).^8)./tf.^3 +...
 (495*Py3*t.^2.*(t./tf - 1).^8)./tf.^3 +(1320*Py3*t.^3.*(t./tf-1).^7)./tf.^4 - (1320*Py4*t.^3.*(t./tf - 1).^7)./tf.^4 -...
 (2310*Py4*t.^4.*(t./tf - 1).^6)./tf.^5 + (2310*Py5*t.^4.*(t./tf - 1).^6)./tf.^5 +(2772*Py5*t.^5.*(t./tf - 1).^5)./tf.^6 - ...
(2772*Py6*t.^5.*(t./tf - 1).^5)./tf.^6 - (2310*Py6*t.^6.*(t./tf -1).^4)./tf.^7 + (2310*Py7*t.^6.*(t./tf - 1).^4)./tf.^7 +...
(1320*Py7*t.^7.*(t./tf -1).^3)./tf.^8 - (1320*Py8*t.^7.*(t./tf - 1).^3)./tf.^8 -(495*Py8*t.^8.*(t./tf - 1).^2)./tf.^9 +(495*Py9*t.^8.*(t./tf -1).^2)./tf.^9;

ydpp=(110*Py9*t.^9)./tf.^11 - (220*Py10*t.^9)./tf.^11 + (110*Py11*t.^9)./tf.^11 - (110*Py0*(t./tf - 1).^9)/tf.^2 + ...
(220*Py1*(t./tf - 1).^9)/tf.^2 - (110*Py2*(t./tf - 1).^9)/tf.^2 + (990*Py1*t.*(t./tf - 1).^8)/tf.^3 - (1980*Py2*t.*(t./tf - 1).^8)/tf.^3 + ...
(990*Py3*t.*(t./tf - 1).^8)./tf.^3 - (990*Py8*t.^8.*(t./tf - 1))./tf.^10 + (1980*Py9*t.^8.*(t./tf - 1))./tf.^10 - (990*Py10*t.^8.*(t./tf - 1))./tf.^10- ...
(3960*Py2*t.^2.*(t./tf - 1).^7)./tf.^4 + (7920*Py3*t.^2.*(t./tf - 1).^7)./tf.^4 + (9240*Py3*t.^3.*(t./tf - 1).^6)./tf.^5 - ...
(3960*Py4*t.^2.*(t./tf - 1).^7)./tf.^4 -(18480*Py4*t.^3.*(t./tf - 1).^6)./tf.^5 - (13860*Py4*t.^4.*(t./tf -1).^5)./tf.^6 + ...
(9240*Py5*t.^3.*(t./tf - 1).^6)./tf.^5 + (27720*Py5*t.^4.*(t./tf - 1).^5)./tf.^6 +(13860*Py5*t.^5.*(t./tf - 1).^4)./tf.^7 -...
(13860*Py6*t.^4.*(t./tf - 1).^5)./tf.^6 -(27720*Py6*t.^5.*(t./tf - 1).^4)./tf.^7 - (9240*Py6*t.^6.*(t./tf - 1).^3)./tf.^8 +...
(13860*Py7*t.^5.*(t./tf - 1).^4)./tf.^7 +(18480*Py7*t.^6.*(t./tf - 1).^3)./tf.^8 + (3960*Py7*t.^7.*(t./tf - 1).^2)./tf.^9 -...
(9240*Py8*t.^6.*(t./tf - 1).^3)./tf.^8 -(7920*Py8*t.^7.*(t./tf - 1).^2)./tf.^9 +(3960*Py9*t.^7.*(t./tf - 1).^2)./tf.^9;
%sigma=t/T;
%sigmap=1/T+0*t;
%sigmapp=0*t;
%%%%%%%%%%% le modèle cinématique  %%%%%%%%%%
perturbation =0
for w=1:T*(1/Te)+1
%     if w<3000
%         a(w)=0;
%     elseif w<5000
%         a(w)=.1;
%     else
%         a(w)=0;
% %     end
 
 
x=x+h*(v*cos(theta));%%iu dois avoir x et y et theta apartir de la capture
y=y+h*(v*sin(theta));
theta=theta+h*omega;
 
erreur1x=(x-xd(w))
erreur2x=(v*cos(theta)-xdp(w));
erreur1y=(y-yd(w));
erreur2y=(v*sin(theta)-ydp(w)); 
 

% sdx(k)=u*cos(theta);
% sdy(k)=u*sin(theta);
 
   %%%%%%%%la commande%%%%%%%%%%%%
nu1=xdpp(w)-k2*erreur2x-k1*erreur1x+perturbation ;
nu2=ydpp(w)-k2*erreur2y-k1*erreur1y+perturbation ;
 
 
v=v+h*(cos(theta)*nu1+sin(theta)*nu2);
 
 
%v=nu*sigmap(w);
if v==0
    omega=0;
else
omega=(cos(theta)*nu2-sin(theta)*nu1)/v;
end
 
sx(w)=x;
sy(w)=y;
sv(w)=(v);
somega(w)=omega;
stheta(w)=theta;
errorx(w)=erreur1x; 
errory(w)=erreur1y; 
end;

figure(1)
plot(t,xd,'--r');
hold
plot(t,sx,'b');
xlabel('time s')
ylabel('x(m) ')
title(' trajectoire désirée vs  trajectoire de robot sur x ');
legend('trajectoire désirée sur x', 'trajectoire de robot sur x');


figure(2)
plot(t,yd,'--r');
hold
plot(t,sy,'b');
xlabel('time s')
ylabel('y(m) ')
title('trajectoire désirée vs  trajectoire de robot sur y ');
legend('trajectoire désirée sur y', 'trajectoire de robot sur y');

figure(3);
plot(sx,sy,'b', 'LineWidth', 1);
hold
plot(xd,yd,'--r');
xlabel('x(m)')
ylabel('y(m) ')
title(' trajectoire désirée vs le trajectoire de robot ');
legend('trajectoire de robot', 'trajectoire désirée');

A = meshgrid(linspace(0, 2*pi,150), linspace(0, 2*pi,150)) ;
Z1 = meshgrid(linspace(0, 3, 150), linspace(0, 3, 150))';
 
X1 = 2+0.7 .* cos(A);
Y1 =1+0.7 .* sin(A);
X2 = 4+0.7 .* cos(A);
Y2 = 0+0.7 .* sin(A);
X3 = 3.2+0.7 .* cos(A);
Y3 = 3+0.7 .* sin(A);
X4 = 5.5+0.7 .* cos(A);
Y4 = 4.5+0.7 .* sin(A);
X5 = 3.8+0.7 .* cos(A);
Y5 = 6+0.7 .* sin(A);
X6 = 7.5+0.7 .* cos(A);
Y6 = 6+0.7 .* sin(A);
surf(X1, Y1, Z1,'facecol','blue','edgecol','Black');
surf(X2, Y2, Z1,'facecol','blue','edgecol','Black');
surf(X3, Y3, Z1,'facecol','blue','edgecol','Black');
surf(X4, Y4, Z1,'facecol','blue','edgecol','Black');
surf(X5, Y5, Z1,'facecol','blue','edgecol','Black');
surf(X6, Y6, Z1,'facecol','blue','edgecol','Black');

figure(4)
plot(t,errorx,'b');
xlabel('time s')
ylabel('erreur en x ')
title('erreur en x');


figure(5);
plot(t,errory,'b');
xlabel('time s')
ylabel('erreur en y ')
title('erreur en Y');


figure(6)
plot(t,sv,'b')
title('vitesse linéaire de robot');
ylabel(' vitesse linéaire de robot')
xlabel('time s')



figure (7)
plot((sx-xi)/(xf-xi),(sy-yi)/(yf-yi))
hold
plot((xd-xi)/(xf-xi),(yd-yi)/(yf-yi),'r')

 


