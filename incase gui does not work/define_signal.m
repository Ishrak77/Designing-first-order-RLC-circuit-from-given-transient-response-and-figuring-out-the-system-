function [xt,fun,tf]=define_signal()
syms t real;
syms s;
xt = input('Enter any signal:','s');
tf = input('Final time of your signal:');
xt = process_signal(xt);
var = input('Periodic or Aperiodic/trigonometric Signal?: [Periodic/Aperiodic] :','s');
switch var
    case 'Aperiodic'
        fun = simplify(laplace(xt));
    case 'Periodic'
        T = input('Time period of the input signal :');
        fun = simplify(laplace(xt)/(1-exp(-s*T)));
        xt = ilaplace(fun);
        if (hasSymType(xt,'ilaplace'))
           disp("Inverse Laplace can't be found");
        end
end