# Filtros Digitais para Remoção de Ruído em Sinais de Voz

Este repositório contém códigos MATLAB que implementam filtros IIR e FIR para a remoção de ruído de amostras de áudio de voz. Esses filtros foram projetados para atenuar ruídos indesejados em sinais de voz, com aplicação de especificações detalhadas para cada filtro.

## Descrição dos Filtros Implementados

### Filtro IIR

O filtro IIR (Infinite Impulse Response) foi projetado para atenuar componentes de ruído adicionados ao sinal de voz. A implementação realiza os seguintes passos:

1. **Amostragem do sinal de voz**: utilizando as funções `audiorecorder`, `recordblocking` e `getaudiodata` para capturar uma amostra de 5 segundos de áudio.
2. **Adição de ruído**: o sinal de ruído, representado por r(t) = a_1*cos(2*pi*f_1*t) + a_2*cos(2*pi*f_2*t), é adicionado ao sinal original.
3. **Filtragem do sinal**: o filtro projetado garante uma atenuação mínima na faixa de rejeição, removendo o ruído indesejado.
4. **Visualização e análise**: são gerados gráficos do sinal de voz original, do sinal corrompido e do sinal filtrado, tanto no domínio do tempo quanto no domínio da frequência (usando `fft` e `fftshift`). Além disso, a resposta em frequência do filtro é apresentada em termos de magnitude e fase (`freqz`).
5. **Salvamento dos sinais**: os sinais de voz original e filtrado são salvos em arquivos de áudio WAV com a função `audiowrite`.

### Filtro FIR

O filtro FIR (Finite Impulse Response) foi projetado como um filtro passa-baixa para remover ruídos de um sinal de voz, usando a resposta ao impulso definida na Parte 1 do projeto. A implementação realiza os seguintes passos:

1. **Amostragem do sinal de voz**: captura uma amostra de áudio com `audiorecorder`, `recordblocking` e `getaudiodata`.
2. **Adição de ruído**: o mesmo ruído representado por r(t) = a_1*cos(2*pi*f_1*t) + a_2*cos(2*pi*f_2*t) é adicionado ao sinal original.
3. **Filtragem do sinal**: o sinal contaminado é filtrado usando a resposta ao impulso projetada para o filtro FIR.
4. **Visualização e análise**: geração de gráficos do sinal de voz, sinal corrompido e sinal filtrado, tanto no domínio do tempo quanto no domínio da frequência. A resposta ao impulso e a resposta em frequência do filtro FIR também são apresentadas (`freqz`).
5. **Salvamento dos sinais**: os sinais de voz original e filtrado são salvos como arquivos de áudio WAV.


Este repositório faz parte de um projeto acadêmico da disciplina de Processamento Digital de Sinais, do curso de Engenharia de Computação da UFRN, que explora o design e a aplicação de filtros digitais no contexto de sinais de voz, focando na remoção de ruídos de alta e baixa frequência de sinais de voz.

