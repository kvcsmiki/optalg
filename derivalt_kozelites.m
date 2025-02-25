f = @(x) x.*sin(x);
df = @(x) sin(x)+x.*cos(x);
xx = linspace(-2*pi,2*pi);
figure(1);
subplot(2,1,1);
plot(xx,f(xx));
subplot(2,1,2);
yy = df(xx);
plot(xx,yy);

[df0, df1] = make_df(f, 0.01);

figure(2);
subplot(2,1,1);
yy0 = df0(xx);
plot(xx, yy0);
subplot(2,1,2);
yy1 = df1(xx);
plot(xx, yy1);

sum(abs(yy-yy0))
sum(abs(yy-yy1))

function [df0, df1] = make_df(f, dx)
    function y = pre_df0(x)
       y=(f(x+dx) - f(x))/dx;
    end
    function y = pre_df1(x)
        y=(f(x+dx)-f(x-dx))/(2*dx);
    end
    df0 = @pre_df0;
    df1 = @pre_df1;
end