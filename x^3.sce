tol = 1 * 10^-6;
p=poly([(90/%pi),0,-9,1],'f','c')
p=real(roots(p))
c = 1
me = 1*10^(-6);

mprintf("Uso del metodo de bisección:\nx^3-9x^2+(90/pi)\n\n");

xi = strtod(input("X inferior: ","s"));
xa = strtod(input("X superior: ","s"));

xr(c) = (xi + xa)/2;
div(c) = abs((xr(c) - p(2)) / p(2));
fxr = xr(c) ^ 3 - 9 * (xr(c) ^ 2) + (90 / %pi);
fxi = xi(c) ^ 3 - 9 * (xi(c) ^ 2) + (90 / %pi);

while div(c) > tol
    c = c + 1;
    if fxi * fxr > 0 then
        xi = xr (c - 1);
        xr(c) = (xi + xa) / 2;
        fxi = xi^3 - 9 * (xi ^ 2) + (90 / %pi);
    else
        xa = xr(c - 1);
        xr(c) = (xi + xa) / 2;
    end
    fxr = xr(c) ^ 3 - 9 * (xr(c) ^ 2) + (90 / %pi);
    div(c) = abs(xr(c) - p(2)) / p(2)
end

mprintf('Iteración %i, resultado: %f\n',c,xr(c));