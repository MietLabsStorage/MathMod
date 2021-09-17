clear
g=9.8;
l=1;
m=0.00356;
v0=800;
M=1; 
k=0.1;

a=get_angle_formul_1_2();

disp('a:')
disp(a)

a=subs(a,'g',g');
a=subs(a,'l',l');
a=subs(a,'m',m');
a=subs(a,'M',M');
a=subs(a,'v0',v0');
a=subs(a,'k',k');
a=a*180/pi;

disp('=')
disp(double(a))