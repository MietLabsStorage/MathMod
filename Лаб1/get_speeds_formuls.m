function [Vx, Vy]=get_speeds_formuls()
    %system for oX
    syms k vx m ax alef 
    ax=(k*vx*vx)/m;
    syms v0 t
    vx_zero=-vx+v0*cos(alef)-ax*t*t/2;
    vx=solve(vx_zero, vx);
    
    %system for oY
    syms g vy ay
    ay=(m*g+k*vy)/m;
    vy_zero=-vy+sign(alef)*v0*sin(alef)-ay*t*t/2;
    vy=solve(vy_zero, vy);

    Vx=vx;
    Vy=vy;
end
