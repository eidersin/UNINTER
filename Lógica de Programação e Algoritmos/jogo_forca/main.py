import jogo as j
from funcoes import mostrar_menu, existeArquivo, abrirArquivoLeitura, criarArquivo, inserirScore, listarArquivo

arquivo = 'jogo_forca/score.txt'
palavras_arquivo = 'jogo_forca/palavras.txt'

if existeArquivo(arquivo):
    print('Arquivo localizado no computador')
else:
    print('Arquivo não encontrado')
    criarArquivo(f'jogo_forca/{arquivo}')

while True:
    mostrar_menu()
    opcao = int(input('Escolha a opção (1/2/3): '))
    match opcao:
        case 1:
            print('Iniciando jogo!')
            j.jogar()
        case 2:
            print('SCORE')
            dados = listarArquivo('jogo_forca/score.txt')
            if not dados:
                print('Score vazio')
            else:
                i = 1
                for jogador in dados:
                    print(f'{i} -> {jogador[0:]}, Pontuação: {jogador[1][:-1]}')
                    i += 1
        case 3:
            print('Saindo do jogo. Até mais')
            break
        case _:
            print('Opção inválida')

