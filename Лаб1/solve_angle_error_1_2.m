clear
g=9.8;
l=1;
m=0.00356;
v0=800;
M=1; 
k=0.1;
Dm=0.00054;
DM=0.05;
Dk=0.01;

Da=get_angle_error_1_2();

disp('Da:')
disp(Da)

Da=subs(Da,'g',g');
Da=subs(Da,'l',l');
Da=subs(Da,'m',m');
Da=subs(Da,'M',M');
Da=subs(Da,'v0',v0');
Da=subs(Da,'k',k');
Da=subs(Da,'Dm',Dm');
Da=subs(Da,'DM',DM');
Da=subs(Da,'Dk',Dk');
Da=Da*180/pi;

disp('=')
disp(double(Da))
