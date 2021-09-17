clear
[H, L]=get_position_formuls();
H=H-'h';
L=L-'l';
syms v0
v=solve(H,v0);
L=subs(L,'v0',v);

%size=100;
size=1;

h=0;
%l=normrnd(481, 60, [1,size]);
l=481.59+0.01;
k=0.0000001;
m=0.00356+0.00054;
v0=800;
h0=1.75+0.15;
alef=0.00018;
g=9.8;
L=subs(L,'m',m);
L=subs(L,'v0',v0);
L=subs(L,'k',k);
L=subs(L,'alef',alef);
L=subs(L,'h0',h0);
L=subs(L,'h',h);
L=subs(L,'g',g);

v0=v;
v0=subs(v0,'m',m);
v0=subs(v0,'k',k);
v0=subs(v0,'h0',h0);
v0=subs(v0,'h',h);
v0=subs(v0,'g',g);
v0=subs(v0,'alef',alef);

v_started=ones(1,size);
for i=1:size
    L_i=subs(L,'l',l(i));
    t=0.0001;
    L_curr=double(subs(L_i,'t',t));
    while(L_curr >= 0.0001)
        t=t+0.001;
        L_curr=double(subs(L_i,'t',t));
    end
    v0_i=subs(v0,'l',l(i));
    v_started(1,i)=double(subs(v0_i,'t',t));
end

if(size==1)
    disp('v, м/с:');
    disp(v_started(1,1));
else
    plot(l, v_started, '*')
    xlabel('L, м')
    ylabel('v, м/с')
    title('Зависимость начальной скорости от дальности полета')
    figure
    histogram(l, 10)
    xlabel('v, м/с')
    ylabel('количество')
    title('Частотность значений начальной скорости пули')
end 