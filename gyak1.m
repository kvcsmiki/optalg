clear;
% x = linspace(-2*pi, 2*pi);
% plot(x, sin(x), x, cos(x));



x = linspace(0,pi);
plot(x, fun(x), x, dfun(x));

a = 0;
b = pi;
f=@(x) sqrt(x)-2*sin(x);
[xopt, fopt] = fminbnd(@fun, a, b)

[aa, bb] = bisect(@dfun, a+0.1, b-0.1, 1e-6, 1e-9)


function [a, b]=bisect(f, a, b, xtol, ftol)
    while abs(b-a) > xtol
        m = 0.5 * (a+b);
        fm = f(m);
        if abs(fm) < ftol
            break;
        end
        if f(a)*f(m) < 0
            b = m;
        else
            a = m;
        end
    end
end

function y=fun(x)
    y=sqrt(x)-2*sin(x);
end

function y=dfun(x)
    y=0.5./sqrt(x)-2*cos(x);
end