clear
syms Mz
syms G
syms S
syms h
syms m0
syms m_d_t
syms t
syms v2ult

F = (101325-1.01325*h)/S + G*Mz*(m0-m_d_t*t)/h/h
v = -(log(abs(m_d_t*t - m0))*(F - m_d_t*v2ult))/(m_d_t*(log(abs(m_d_t*t - m0)) + 1));

v = subs(v, 'Mz', 5.97*(10^24)); 
v = subs(v, 'G', 6.67*(10^(-11)));
v = subs(v, 'S', 43.00840);
v = subs(v, 'm0', 300000);
v = subs(v, 'm_d_t', 100);
v = subs(v, 'v2ult', 3000)

h_formul = v*t 
h_formul = subs(h_formul, 't',0.0001)
h = solve(h_formul - h, h)
h = h(1)

v=subs(v, 'h', abs(double(h)))
v=subs(v, 't', 0.0001)
