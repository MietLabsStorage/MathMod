clear
g=9.8;
l=1;
m=0.00356;
M=1; 
k=0.1;

size=100;
if(size==1)
    a=50.9359/180*pi
else
    a=normrnd(50.9359/180*pi, 5.227*3/180*pi, [1,size]);
end

v0=get_speed_formul_1_2();

disp('v0:')
disp(v0)

v0=subs(v0,'g',g');
v0=subs(v0,'l',l');
v0=subs(v0,'m',m');
v0=subs(v0,'M',M');
v0=subs(v0,'k',k');

for i=1:size
    v_started(1,i)=double(subs(v0,'a',a(i)));
end

if(size==1)
    disp('=')
    disp(v_started(1,1))
else
    a=a.*180./pi;
    plot(a, v_started, '*')
    xlabel('a, deg')
    ylabel('v, м/с')
    title('Зависимость начальной скорости от eukf jnrkjytybz')
    figure
    histogram(a, 10)
    xlabel('v, м/с')
    ylabel('количество')
    title('Частотность значений начальной скорости пули')
end