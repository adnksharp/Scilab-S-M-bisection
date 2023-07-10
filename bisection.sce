a = [ ], f = [ ];
tol = 0.5 / 100;
c = 1;

mprintf("Metodo de bisección\nf(x) = ");
fx = input("", "s");
mprintf("Desde: ");
A = input("", "s");
mprintf("Hasta: ");
B = input("", "s");
mprintf("...\n");

x = strsubst(fx, " ", "");
in_k = strstr(x, "x^3");
if in_k ~= "" then
	k = strsplit(x, "x^3");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(1) = "1";
		else
			a(1) = k(1);
		end
		x = k(2);
	end
else
	a(1) = "0";
end

in_k = strstr(x, "x^2");
if in_k ~= "" then
	k = strsplit(x, "x^2");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(2) = "1";
		else
			a(2) = k(1);
		end
		x = k(2);
	end
else
	a(2) = "0";
end

in_k = strstr(x, "x");
if in_k ~= "" then
	k = strsplit(x, "x");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(3) = "1";
		else
			a(3) = k(1);
		end
		x = k(2);
	end
else
	a(3) = "0";
end

if length(x) > 0 then
	a(4) = x;
else
	a(4) = "0";
end

for i = 1:4
	a(i) = strsubst(a(i), "(", "");
	a(i) = strsubst(a(i), ")", "");
	a(i) = strsubst(a(i), "%pi", "3.141592653589");
	a(i) = strsubst(a(i), "%e", "2.718281828459");
	k = strsplit(a(i), "/");
	if size(k, "*") > 1 then
		f(5 - i) = strtod(k(1)) / strtod(k(2));
	else
		k = strsplit(a(i), "*");
		if size(k, "*") > 1 then
			f(5 - i) = strtod(k(1)) * strtod(k(2));
		else
			f(5 - i) = strtod(a(i));
		end
	end
end

xi = strtod(A);
xa = strtod(B);

xr(c) = (xi + xa) / 2;
frx = ( f(4) * xr(c)^3 ) + ( f(3) * xr(c)^2 ) + ( f(2) * xr(c) ) + f(1);
fxi = ( f(4) * xi^3 ) + ( f(3) * xi^2 ) + ( f(2) * xi ) + f(1);

while abs(frx) > tol then
	c = c + 1;
	if fxi * frx > 0 then
		xi = xr(c - 1);
		fxi = ( f(4) * xi^3 ) + ( f(3) * xi^2 ) + ( f(2) * xi ) + f(1);
	else
		xa = xr(c - 1);
	end
	xr(c) = (xi + xa) / 2;
	frx = ( f(4) * xr(c)^3 ) + ( f(3) * xr(c)^2 ) + ( f(2) * xr(c) ) + f(1);
	if c > 10000 then
		c = 0;
		break;
	end
end

if c == 0 then
	mprintf("No se encontro raiz en 10000 iteraciones\n");
else
	mprintf("Raiz de f(x) = %s entre %s y %s = %s con %d iteraciones\n", fx, A, B, string(xr(c)), c);
end
