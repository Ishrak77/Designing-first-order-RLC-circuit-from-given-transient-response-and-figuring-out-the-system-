function [L,C] = findlc_manami(f,idx,R,selected_circuit)
x=selected_circuit;
if idx == 1  
    switch x
        case 'RC'
            C = f.tau/R;
            L=0;
        case 'RL'
            L = f.tau*R;
            C=0;
    end
else
    [a,w] = find_aw_manami(f,idx);
    switch x
        case 'RLC series'
            L=R/(2*a);
            C=1/(L*w^2);
        case 'RLC parallel'
            C=1/(2*a*R);
            L=1/(C*w^2);
    end
end