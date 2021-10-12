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

v_m0 = 500000;
v_u = 3000;
v_m_p = 1000;
v_m_d_t = 50000;

v = subs(v, 'u', v_u);
v = subs(v, 'm_d_t', v_m_d_t);
v = subs(v, 'm_p', v_m_p);

h = subs(h, 'u', v_u);
h = subs(h, 'm_d_t', v_m_d_t);
h = subs(h, 'm_p', v_m_p);

hold on
grid on
xlim([0 H])
for lambda = 0.02:0.03:0.2
    
    clear vlh vlv vlm
    vl = v;
    hl = h;
    
    v_m_s = v_m0 * lambda;
    v_m_t = v_m0 - v_m_s - v_m_p;
    
    vl = subs(vl, 'm_s', v_m_s);
    vl = subs(vl, 'm_t', v_m_t);     
    hl = subs(hl, 'm_s', v_m_s);
    hl = subs(hl, 'm_t', v_m_t);
    
    i = 1;
    count = 0;
    vlh(i) = double(subs(hl, 't', count));
    vlv(i) = double(subs(vl, 't', count));
    vlm(i) = double(subs((v_m_d_t* t), 't', count));
    
    while vlh(i) < H
        count = count + dt;
        i=i+1;
        vlv(i) = double(subs(vl, 't', count));
        vlh(i) = double(subs(hl, 't', count));
        vlm(i) = double(subs((v_m_d_t* t), 't', count));
    end    
    plot(vlh, vlv)  
end
xlabel('h, м')
ylabel('v, м/с')
x = 0:1000:H;
speed1 = x*0+7844;
speed2 = x*0+11200;
plot(x, speed1, '*')
plot(x, speed2, '+')
legendVals = 0.02:0.03:0.2;
legendVals = arrayfun(@num2str, legendVals, 'UniformOutput', false);
legendVals(end+1) = {'ПКМ'};
legendVals(end+1) = {'ВКМ'};
legend(legendVals)
title('Зависимость скорости ракеты от достигнутой высоты, коэффициента структурной массы')










