n = 0:36;

M = 200;
k = (-2*M):(2*M)

x = sinc((n-18)*97*pi/120).*(97/120)

X = x*exp(-j*(pi/M).*n'*k);

%plot(k,abs(X))
%plot(k,angle(X))
stem(n,x)
