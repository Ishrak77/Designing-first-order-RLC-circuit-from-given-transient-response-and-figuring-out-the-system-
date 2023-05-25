function picture(xt,fun,R,L,C,x,tf)
syms t real;
syms s;
switch x
    case 'RC'
        p = input('What do you want to find? [Vr/Vc/I] :','s');
        I = simplify(fun/(R+1/(s*C)));
        switch p
            case 'I'
                yt = ilaplace(I);
            case 'Vr'
                yt = ilaplace(I*R);
            case 'Vc'
                yt = ilaplace(I/(s*C));
        end
    case 'RL'
        p = input('What do you want to find? [Vr/Vl/I] :','s');
        I = simplify(fun/(R+s*L));
        switch p
            case 'I'
                yt = ilaplace(I);
            case 'Vr'
                yt = ilaplace(I*R);
            case 'Vl'
                yt = ilaplace(I*s*L);
        end
    case 'Series'
        p = input('What do you want to find? [Vr/Vl/Vc/I] :','s');
        I= simplify(fun/(R+s*L+1/(s*C)));
        switch p
            case 'I'
                yt = ilaplace(I);
            case 'Vr'
                yt = ilaplace(I*R);
            case 'Vl'
                yt = ilaplace(I*s*L);
            case 'Vc'
                yt = ilaplace(I/(s*C));
        end
    case 'Parallel'
        p = input('What do you want to find? [Ir/Il/Ic/V] :','s');
        switch p
            case 'V'
                yt = xt;
            case 'Ir'
                yt = ilaplace(fun/R);
            case 'Il'
                yt = ilaplace(fun/(s*L));
            case 'Ic'
                yt = ilaplace(fun*s*C);
        end
end
xt=vpa(simplify(xt,'IgnoreAnalyticConstraints',true,'Steps',50),2);
subplot(2,1,1);
fplot(xt,[0 tf],'r');
line(xlim, [0 0]);
xlabel('Time');
ylabel('Vin');
yt=vpa(simplify(yt,'IgnoreAnalyticConstraints',true,'Steps',50),2);
subplot(2,1,2);
fplot(yt,[0 tf],'g');
line(xlim, [0 0]);
xlabel('Time');
ylabel(p);