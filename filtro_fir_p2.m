% Parâmetros
n = 0:36;
fs = 14000;
f1 = 5700;
f2 = 6000;

% Filtro no domínio do tempo
Wc = (173 / 280) * pi; % Frequência de corte

filtro_tempo = sinc(((n - 18)/pi) * Wc) * Wc/pi;
%plot((-512:511)*(fs/1024), abs(fftshift(fft(filtro_tempo, 1024))));

% Filtro no domínio da frequência
filtro_freq = fft(filtro_tempo);

% filtro_tempo_expandido = repmat(filtro_tempo, 1, size(n' * k, 2));
% filtro_freq = filtro_tempo_expandido .* exp(-1i * (pi / M) .* n' * k);
% filtro_freq = filtro_tempo .* exp(-1i * (pi / M) .* n' * k);

% Gravação de áudio
gravacao = audiorecorder(fs, 16, 1);
recordblocking(gravacao, 5);
minhagravacao = getaudiodata(gravacao);

% Projetando o ruído
N = 0:length(minhagravacao)-1;
a = sqrt(var(minhagravacao));
r = a * (cos(2 * pi * f1 * N / fs) + cos(2 * pi * f2 * N / fs));

% Adicionando o ruído ao sinal gravado
r = reshape(r, size(minhagravacao));
sinal_cont = minhagravacao + r;

% Filtrando o sinal
v_filtrado = filter(filtro_freq, 1, sinal_cont);

% reproduzir o áudio resultante
%plot(v_filtrado);
sound(minhagravacao, fs);
sound(sinal_cont, fs);
sound(v_filtrado, fs);
