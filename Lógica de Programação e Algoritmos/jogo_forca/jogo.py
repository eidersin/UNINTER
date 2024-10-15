from funcoes import mostrar_menu, existeArquivo, abrirArquivoLeitura, criarArquivo, inserirScore, listarArquivo
from random import choice
from desenho import desenhar_forca, imprimir_palavra_secreta

def jogar():
    lista_palavras = list()
    
    # Tentar abrir o arquivo
    arquivo = abrirArquivoLeitura('palavras.txt')
    
    # Verificar se o arquivo foi aberto corretamente
    if arquivo is None:
        print("Erro: o arquivo de palavras não pôde ser aberto. O jogo não pode continuar.")
        return  # Encerra a execução da função se o arquivo não for aberto
    
    # Se o arquivo foi aberto, processa o conteúdo
    for linha in arquivo:
        palavra = linha.strip()
        lista_palavras.append(palavra)
    
    arquivo.close()  # Certifique-se de fechar o arquivo depois de usá-lo
    
    # Continua a lógica do jogo...
    palavra_sorteada = choice(lista_palavras)
    for x in range(50):
        print()

    digitadas = []
    acertos = []
    erros = 0

    nome = input('Quem está jogando? ')

    while True:
        adivinha = imprimir_palavra_secreta(palavra_sorteada, acertos)

        if adivinha == palavra_sorteada:
            print('Você acertou!')
            break

        tentativa = input('\nDigite uma letra: ').lower().strip()

        if tentativa in digitadas:
            print('Você já usou esta letra!')
            continue
        else:
            digitadas.append(tentativa)
            if tentativa in palavra_sorteada:
                acertos.append(tentativa)
            else:
                erros += 1
                print('Você errou!')
        
        score = desenhar_forca(erros)
        
        # Condição de fim de jogo
        if erros == 6:
            print('Enforcado!')
            print(f'A palavra correta era {palavra_sorteada}')
            break

    inserirScore('jogo_forca/score.txt', nome, score)