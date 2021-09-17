clear
g=9.8;
l=1;
m=0.00356;
a=50.9359/180*pi;
M=1; 
k=0.1;
Dm=0.00054;
DM=0.05;
Dk=0.05;
Da=1*pi/180;

Dv=get_speed_error_1_2();

disp('Dv:')
disp(Dv)

Dv=subs(Dv,'g',g');
Dv=subs(Dv,'l',l');
Dv=subs(Dv,'m',m');
Dv=subs(Dv,'M',M');
Dv=subs(Dv,'a',a');
Dv=subs(Dv,'k',k');
Dv=subs(Dv,'Dm',Dm');
Dv=subs(Dv,'DM',DM');
Dv=subs(Dv,'Dk',Dk');
Dv=subs(Dv,'Da',Da');

disp('=')
disp(double(Dv))
