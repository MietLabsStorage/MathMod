function [X, H] = RealEnemyPath(v0, alef)
    t=0;
    index = 1;
    X(index) = 0;
    H(index) = 0;
    while(true)
       t=t+0.01;
       index=index+1;
       X(index) = v0*cos(alef)*t;
       H(index) = v0*sin(alef)*t-9.8*t*t/2;
       if H(end)<=0 && X(end)>0
           break
       end
    end
end

