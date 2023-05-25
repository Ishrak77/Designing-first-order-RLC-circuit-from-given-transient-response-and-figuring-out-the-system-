function [xt,fun,tf]=define_signal_new(xt_input,tf_input,var,timeperiod)
syms t real;
syms s;
xt = xt_input;
tf = tf_input;
xt = process_signal_manami(xt);
switch var
    case 'Aperiodic/Triagonometric'
        fun = simplify(laplace(xt));
    case 'Periodic'
        T = timeperiod;
        fun = simplify(laplace(xt)/(1-exp(-s*T)));
        xt = ilaplace(fun);
%         if (hastype(xt,'ilaplace'))
%            msgbox("Inverse Laplace can't be found");
%         end
end