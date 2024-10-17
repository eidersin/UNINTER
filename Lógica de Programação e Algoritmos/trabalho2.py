"""
Calcula o valor total do pedido de pizzas de acordo com o sabor e o tamanho escolhidos pelo cliente.

Funções:
- menu(): Exibe o cardápio com preços de pizzas salgadas e doces.
- pedir_pizza(tamanho, sabor, acumulador): Calcula o valor da pizza baseada no tamanho e sabor escolhidos pelo cliente e acumula o valor total do pedido.

Parâmetros da função pedir_pizza:
- tamanho (str): Tamanho da pizza ('P', 'M', ou 'G').
- sabor (str): Sabor da pizza ('PS' para pizza salgada, 'PD' para pizza doce).
- acumulador (float, opcional): Acumulador que armazena o valor total do pedido. Valor inicial é 0.

Retorno:
- float: Valor total atualizado após o pedido.

O programa permite que o cliente faça múltiplos pedidos, valida as entradas e calcula o valor final.
"""

# Função para exibir o menu da pizzaria e informações iniciais
def menu():
    print(10 * '-' + ' Bem-vindo a Pizzaria do Wanderson Teixeira ' + 10 * '-')
    print(64 * '-')
    print(27 * '-' + ' Cardápio ' + 27 * '-')
    print(64 * '-')
    print(3 * '-' + '|  Tamanho  |   Pizza Salgada (PS)   |   Pizza Doce (PD) |' + 3 * '-')
    print(3 * '-' + '|     P     |        R$ 30.00        |     R$ 34.00      |' + 3 * '-')
    print(3 * '-' + '|     M     |        R$ 45.00        |     R$ 48.00      |' + 3 * '-')
    print(3 * '-' + '|     G     |        R$ 60.00        |     R$ 66.00      |' + 3 * '-')
    print(64 * '-')

# Função para processar o pedido de pizza
def pedir_pizza(tamanho, sabor, acumulador=0):
    # Verifica o sabor da pizza e atribui o preço de acordo com o tamanho
    if sabor == 'PS':
        if tamanho == 'P':
            preco = 30
        elif tamanho == 'M':
            preco = 45
        elif tamanho == 'G':
            preco = 60
        print(f'\nVocê pediu uma Pizza Salgada no tamanho {tamanho}: R$ {preco:.2f} reais')
    elif sabor == 'PD':
        if tamanho == 'P':
            preco = 34
        elif tamanho == 'M':
            preco = 48
        elif tamanho == 'G':
            preco = 66
        print(f'\nVocê pediu uma Pizza Doce no tamanho {tamanho}: R$ {preco:.2f} reais')
    
    # Soma o preço ao acumulador de total
    acumulador += preco  
    return acumulador

# Exibe o menu
menu()
acumulador = 0  # Inicializa o acumulador de preço total

while True:
    try:
        # Solicita o sabor da pizza ao cliente
        sabor = input('\nEntre com o sabor desejado (PS/PD): ').upper()
        # Verifica se o sabor informado é inválido
        while sabor not in ['PS', 'PD']:
            print('Sabor inválido. Tente novamente.\n')
            sabor = input('Entre com o sabor desejado (PS/PD): ').upper()
        
        # Solicita o tamanho da pizza ao cliente
        tamanho = input('Entre com o tamanho desejado (P/M/G): ').upper()
        # Verifica se o tamanho informado é inválido
        while tamanho not in ['P', 'M', 'G']:
            print('Tamanho inválido. Tente novamente.\n')
            tamanho = input('Entre com o tamanho desejado (P/M/G): ').upper()

        # Atualiza o acumulador com o valor retornado pela função pedir_pizza
        acumulador = pedir_pizza(tamanho, sabor, acumulador)
        
        # Pergunta se o cliente deseja mais alguma coisa
        mais_pizza = input('\nDeseja mais alguma coisa? (S/N): ').upper()

        # Verifica se a resposta é inválida
        while mais_pizza not in ['S', 'N']:
            mais_pizza = input('\nDeseja mais alguma coisa? (S/N): ').upper()
        
        # Finaliza o programa caso o cliente não queira mais pizzas
        if mais_pizza == 'N':
            print(f'\nO valor total a ser pago: R$ {acumulador:.2f}')
            break

    except ValueError:
        print('\nEntrada inválida. Por favor, tente novamente.')
