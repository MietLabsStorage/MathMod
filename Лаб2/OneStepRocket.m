clear
syms u
syms v
syms t
syms m_d_t
syms m_p
syms m_s
syms m_t
syms h

H = 100000;
dt = 0.1;

v = u*log(1+m_d_t*t/(m_s+m_p));
h = v*t+diff(v,t)*t*t/2;

v_lambda = 0.02;
v_m0 = 500000;
v_u = 3000;
v_m_p = 1000;
v_m_d_t = 50000;
v_m_s = v_m0 * v_lambda;
v_m_t = v_m0 - v_m_s - v_m_p;

v = subs(v, 'u', v_u);
v = subs(v, 'm_p', v_m_p);
v = subs(v, 'm_s', v_m_s);
v = subs(v, 'm_t', v_m_t);
v = subs(v, 'm_d_t', v_m_d_t);    
        
h = subs(h, 'u', v_u);
h = subs(h, 'm_p', v_m_p);
h = subs(h, 'm_s', v_m_s);
h = subs(h, 'm_t', v_m_t);
h = subs(h, 'm_d_t', v_m_d_t);

hold on
grid on
xlim([0 H])
i = 1;
count = 0;
vh(i) = double(subs(h, 't', count));
vv(i) = double(subs(v, 't', count));
vm(i) = double(subs((v_m_d_t* t), 't', count));
    
while vh(i) < H
    count = count + dt;
    i=i+1;
    vv(i) = double(subs(v, 't', count));
    vh(i) = double(subs(h, 't', count));
    vm(i) = double(subs(v_m_s+v_m_p+v_m_t-(v_m_d_t* t), 't', count));
end
plot(vh, vm)    
xlabel('h, м')
ylabel('m, кг')
title('Зависимость массы оставшегося топлива от высоты')

disp('m топлива (кг):')
disp(vm(end))

disp('v (м/с):')
disp(vv(end))
