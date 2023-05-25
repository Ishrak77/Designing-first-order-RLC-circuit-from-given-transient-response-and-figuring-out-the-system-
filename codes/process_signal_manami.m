function xt=process_signal_manami(xt)
syms t;
xt = replace(xt,'u','heaviside');
seg = extractBetween(xt,'r',')');
n = length(seg);
new = string();
for i = 1:n
    k = seg(i);
    new(i) = strjoin(string({k ')*heaviside'}));
end
for i = 1:n
    pos = strfind(xt,'r');
    pos = pos(i);
    if pos
        xt = insertAfter(xt,pos,new(i));
    end
end
xt = str2sym(erase(xt,{'amp';'r'}));