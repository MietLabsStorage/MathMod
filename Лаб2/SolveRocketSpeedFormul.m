clear
syms u
syms v
syms t
syms m_d_t
syms m_p
syms m_s
syms m_t

dv = ((-(v+u) * m_d_t) / (m_s + m_p + m_t - m_d_t* t))
v_formul = int(dv, t);
v_formul = abs(solve(v_formul - v, v));
disp('v(t):')
disp(v_formul)