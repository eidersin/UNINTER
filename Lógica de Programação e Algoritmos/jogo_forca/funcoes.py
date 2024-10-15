def existeArquivo(nomeArquivo):
    try:
        a = open(nomeArquivo, 'rt')
        a.close()
    except FileNotFoundError:
        return False
    else:
        return True

def abrirArquivoLeitura(nomeArquivo):
    try:
        a = open(r'C:\Users\Wanderson\Documents\GitHub\UNINTER\Lógica de Programação e Algoritmos\jogo_forca\palavras.txt', 'r')
    except FileNotFoundError:
        print(f'Arquivo {nomeArquivo} não encontrado.')
        return None
    except Exception as e:
        print(f'Erro ao abrir o arquivo {nomeArquivo}: {e}')
        return None
    else:
        print(f'Arquivo {nomeArquivo} aberto com sucesso!\n')
        return a


def criarArquivo(nomeArquivo):
    try:
        a = open(nomeArquivo, 'wt+')
        a.close()
    except:
        print('Erro na criação do arquivo')
    else:
        print(f'Arquivo {nomeArquivo} criado com sucesso\n')

def listarArquivo(nomeArquivo):
    try:
        a = open(nomeArquivo, 'rt')
    except:
        print('Erro ao ler o arquivo.')
    else:
        dados = a.readlines()
    finally:
        a. close()
        return dados

def inserirScore(nomeArquivo, nomeJogador, score):
    try:
        a = open(nomeArquivo, 'at')
    except:
        print('Erro ao abrir o arquivo')
    else:
        a.write(f'{nomeJogador}:{score}\n')
    finally:
        a.close()

def mostrar_menu():
    print('=' * 30)
    print(' ' * 7 + 'JOGO DA FORCA')
    print('=' * 30)
    print('\n1 - JOGAR')
    print('2 - SCORE')
    print('3 - SAIR\n')
    print('=' * 30)
