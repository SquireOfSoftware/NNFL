% ex37.m
% matlab code for the first update

clear

x1=[0;0;-1];
x2=[0;1;-1];
x3=[1;1;-1];
x4=[1;0;-1];

d1=[-1];
d2=[1];
d3=[-1];
d4=[1];

I0=2; J0=2; K=1;
I=I0+1;J=J0+1;
eta=0.1;

w=[-0.8568 0.3998 -1.0702];
wb=[-6.9938 6.6736 1.5555
    -4.2812 3.9127 3.6233];

disp('Step 1')
x=x1
d=d1
vb=wb*x

for i=1:I0
    y(i,1)=(1-exp(-vb(i,1)))/(1+exp(-vb(i,1)));
end
y=[y;-1]

v=w*y
z=(1-exp(-v))/(1+exp(-v))
e=d-z
delta=e*0.5*(1-z^2)

disp("deltab calc");
disp(w);
for j=1:J0 %which is 2
    disp(["weight entry", w(:,j)]);
    disp(["delta value", delta(:,1)]);
    disp(delta(:,1)'*w(:,j));
    disp(["differential", 0.5*(1-y(j,1)^2)]);
    deltab(j,1)=delta(:,1)'*w(:,j)*0.5*(1-y(j,1)^2);
end
deltab

%w=w+eta*delta*y';
%wb=wb+eta*deltab*x';

disp('Updated: w2 and wb2')
w
wb

