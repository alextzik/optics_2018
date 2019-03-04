function h = ang(centre,radius,span,style, color)

theta = linspace(span(1),span(2),100);
rho = ones(1,100) * radius;
[x,y] = pol2cart(theta,rho);
x = x + centre(1);
y = y + centre(2);
h = plot(x,y, 'LineStyle', style, 'Color', color);
end
