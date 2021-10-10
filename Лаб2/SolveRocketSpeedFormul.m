clear
syms m_d_t
syms v_2ult
syms v
syms F
syms M
syms t
dv = (-m_d_t * v_2ult+m_d_t * v + F) / (M - m_d_t * t);
v_formul = int(dv, t);
v_formul = solve(v_formul - v, v);
disp('v(t):')
disp(v_formul)