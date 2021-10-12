clear
syms u
syms v
syms t
syms m_d_t
syms m_p
syms m_s
syms m_t
syms h

syms d_mp
syms d_mdt

v = u*log(1+m_t/(m_s+m_p));
dv = diff(v, m_p)*d_mp + diff(v, m_d_t)*d_mdt

v_lambda = 0.02;
v_m0 = 500000;
v_u = 3000;
v_m_p = 1000;
v_m_d_t = 50000;
v_m_s = v_m0 * v_lambda;
v_m_t = v_m0 - v_m_s - v_m_p;

v_dmp = 10;
v_dmdt = 50;

dv = subs(dv, 'u', v_u);
dv = subs(dv, 'm_p', v_m_p);
dv = subs(dv, 'm_s', v_m_s);
dv = subs(dv, 'm_t', v_m_t);
dv = subs(dv, 'm_d_t', v_m_d_t);  
dv = subs(dv, 'd_mp', v_dmp);
dv = subs(dv, 'd_dmdt', v_dmdt);

disp('dv:')
disp(double(dv))