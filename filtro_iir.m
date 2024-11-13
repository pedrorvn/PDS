% Parâmetros
n = 0:36;
fs = 14000;
f1 = 5700;
f2 = 6000;

% Gravação de áudio
gravacao = audiorecorder(fs, 16, 1);
recordblocking(gravacao, 5);
minhagravacao = getaudiodata(gravacao);

% Projetando o ruído
Nr = 0:length(minhagravacao)-1;
s = sqrt(var(minhagravacao));
r = s * (cos(2 * pi * f1 * Nr / fs) + cos(2 * pi * f2 * Nr / fs));

% Adicionando o ruído ao sinal gravado
r = reshape(r, size(minhagravacao));
sinal_cont = minhagravacao + r;

%Implementando filtro Butterworth
%Parametros do Filtro (W em rad e G em dB)
Delta_w = 0.05
Ws = 5000*2/fs;
Wp = Ws - Delta_w;
Gp = 0.1;
Gs = -20;

%Funções do filtro

[N,Wo] = buttord(Wp,Ws,Gp,Gs);
[B,A] = butter(real(N),Wo,'low');
%[b,a] = lp2lp(B,A,real(Wo));
[bt,at] = bilinear(B,A,fs);

%Sinal após filtragem
xbutter = filter(bt,at,sinal_cont)
[H,w] = freqz(bt,at)
sound(minhagravacao,fs)
sound(sinal_cont,fs)
sound(xbutter,fs)
