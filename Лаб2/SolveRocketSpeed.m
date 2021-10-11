clear
syms u
syms v
syms t
syms m_d_t
syms m_p
syms m_s
syms m_t
syms G
syms Mz
syms h
v = abs(-u*log(abs(m_d_t*t - m_s - m_t - m_p)))/(log(abs(m_d_t*t - m_s - m_t - m_p)) - 1);
h=v*t-diff(v,t)*t*t/2;

v_lambda = 0.1;
v_m0 = 500000;
v_u = 3000;
v_m_p = 1000;
v_m_d_t = 49000;
v_m_s = v_m0 * v_lambda
v_m_t = v_m0 - v_m_s - v_m_p

v = subs(v, 'u', v_u);
v = subs(v, 'm_d_t', v_m_d_t);
v = subs(v, 'm_p', v_m_p);
v = subs(v, 'm_s', v_m_s);
v = subs(v, 'm_t', v_m_t);
        
h = subs(h, 'u', v_u);
h = subs(h, 'm_d_t', v_m_d_t);
h = subs(h, 'm_p', v_m_p);
h = subs(h, 'm_s', v_m_s);
h = subs(h, 'm_t', v_m_t);

vh(1) = double(subs(h, 't', 0));
vv(1) = double(subs(v, 't', 0));
vm(1) = double(subs((v_m_d_t* t), 't', 0));
count = 0;
i=1
while(vh(i) < 100000) 
    count = count +0.1;
    i=i+1;
    vv(i) = double(subs(v, 't', count));
    vh(i) = double(subs(h, 't', count));
    vm(i) = double(subs((v_m_d_t* t), 't', count));
end
plot(vh, vv, 'b.')


