clear
[h, L]=get_position_formuls();
g=9.8;
k=0.0000001;
m=0.00356;
v0=800;
h0=1.75;
alef=-1;

h=subs(h,'g',g);
h=subs(h,'k',k);
h=subs(h,'m',m);
h=subs(h,'v0',v0);
h=subs(h,'h0',h0);
h=subs(h,'alef',alef);
L=subs(L,'m',m);
L=subs(L,'v0',v0);
L=subs(L,'k',k);
L=subs(L,'alef',alef);

t=0;
h_curr=eval(subs(h,'t',t));
while(h_curr >= 0.0001)
    t=t+0.001;
    h_curr=eval(subs(h,'t',t));
end
t
L_fin=vpa(subs(L,'t',t),5)
