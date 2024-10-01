def eh_positivo(numero):
    """
    Função para ver se o número é positivo
    """
    if numero >= 0:
        return True
    else:
        return False
    
def fatorial(numero):
    """
    Função para calcular a fatorial de um número.
    :param numero: Entrada do valor para calcular a fatorial
    :return: Retorno do valor da fatorial
    """
    fat = 1
    if eh_positivo(numero) == True:
        if numero == 0 or numero == 1:
            return fat    
        for i in range(1, numero + 1, 1):
            fat *= i
        return fat

while True:     
    try:
        numero = int(input('Digite um valor para calcular a fatorial: '))
        if numero >= 0:
            print(f'{numero}! = {fatorial(numero)}')
            break
        else: 
            print('O Valor deve ser positivo.')
    except ValueError:
        print('Valor incorreto.')