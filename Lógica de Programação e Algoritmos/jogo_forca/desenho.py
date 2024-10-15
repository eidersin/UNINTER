def imprimir_palavra_secreta(palavra, acertos):
    advinha = ''
    for letra in palavra:
        if letra in acertos:
            advinha += letra
        else:
            advinha += '\u2588'  # Bloco para letras não adivinhadas
    print(f'\nADVINHE ({len(palavra)} letras): ', end='')
    for letra in advinha:
        print(f'{letra} ', end='')
    print()  # Quebra de linha ao final
    return advinha

def desenhar_forca(erros):
    score = 1000  # Pontuação inicial

    estagio_forca = [
        "X==:==\nX  :  \nX\nX\nX\n==========",          # 0 erros
        "X==:==\nX  :  \nX  O\nX\nX\n==========",        # 1 erro
        "X==:==\nX  :  \nX  O\nX  |\nX\n==========",     # 2 erros
        "X==:==\nX  :  \nX  O\nX /|\nX\n==========",     # 3 erros
        "X==:==\nX  :  \nX  O\nX /|\\\nX\n==========",   # 4 erros
        "X==:==\nX  :  \nX  O\nX /|\\\nX /\n==========", # 5 erros
        "X==:==\nX  :  \nX  O\nX /|\\\nX / \\\n==========" # 6 erros
    ]

    # Exibe o estágio atual da forca com base no número de erros
    print(estagio_forca[min(erros, 6)])

    # Reduz a pontuação com base nos erros
    score_map = {0: 1000, 1: 800, 2: 600, 3: 400, 4: 200, 5: 100, 6: 0}
    score = score_map.get(erros, 0)

    return score
