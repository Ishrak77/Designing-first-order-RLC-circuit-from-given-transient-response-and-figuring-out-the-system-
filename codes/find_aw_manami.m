function [a,w]=find_aw_manami(f,idx)
switch idx
    case 2
        a=(f.s1+f.s2)/-2;
        w=sqrt(f.s1*f.s2);
    case 3
        a = f.a;
        w = a;
    case 4
        a=f.a;
        w=sqrt(f.w^2+a^2);
end