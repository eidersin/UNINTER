"""
Calcula o valor total da compra de toras de madeira, considerando o tipo de madeira, a quantidade de toras, o desconto proporcional à quantidade, e o custo do transporte.

Parâmetros:
    valor_madeira (str): O tipo de madeira escolhido, que pode ser:
        - 'PIN': Pinho
        - 'PER': Peroba
        - 'MOG': Mogno
        - 'IPE': Ipê
        - 'IMB': Imbuia
    quantidade (float): A quantidade de toras em metros cúbicos (m³). O valor deve estar entre 0 e 2000.
    desconto (float): Percentual de desconto aplicado com base na quantidade de toras:
        - 0% para menos de 100 m³
        - 4% para entre 100 e 499 m³
        - 9% para entre 500 e 999 m³
        - 16% para 1000 m³ ou mais
    valor_transporte (float): O custo do transporte, que pode ser:
        - 1000.00 para transporte rodoviário
        - 2000.00 para transporte ferroviário
        - 2500.00 para transporte hidroviário

Retorno:
    str: O valor total a pagar, formatado com duas casas decimais (ex: "R$ 12345.67").
"""

def escolha_tipo():
    madeiras_validas = {'PIN': 150.40, 'PER': 170.20, 'MOG': 190.90, 'IPE': 210.10, 'IMB': 220.70}
    while True:
        madeira = input('\nEntre com o Tipo de Madeira desejado\nPIN - Tora de Pinho\nPER - Tora de Peroba\nMOG - Tora de Mogno\nIPE - Tora de Ipê\nIMB - Tora de Imbuia\nQual código: ').upper()
        if madeira in madeiras_validas:
            return madeiras_validas[madeira]
        else:
            print('Escolha inválida, entre com o modelo novamente.')

def qtd_toras():
    while True:
        try:
            quantidade = float(input('\nEntre com a quantidade de toras (m³): '))
            if quantidade < 0 or quantidade > 2000:
                print('Não aceitamos pedidos com essa quantidade de toras. Entre novamente.')
            elif quantidade < 100:
                return quantidade, 0
            elif quantidade < 500:
                return quantidade, 4
            elif quantidade < 1000:
                return quantidade, 9
            else:
                return quantidade, 16
        except ValueError:
            print('Quantidade inválida. Por favor, insira um número.')

def transporte():
    while True:
        try:
            opcao = int(input('\nEscolha o tipo de Transporte:\n1- Transporte Rodoviário - R$ 1000.00\n2 - Transporte Ferroviário - R$ 2000.00\n3 - Transporte Hidroviário - R$ 2500.00\nQual transporte (1/2/3)? '))
            if opcao == 1:
                return 1000
            elif opcao == 2:
                return 2000
            elif opcao == 3:
                return 2500
            else:
                print('Opção inválida.')
        except ValueError:
            print('Escolha inválida. Insira um número.')

    
print("Bem-vindos a Madeireira do Wanderson Teixeira Sousa")

valor_madeira = escolha_tipo()
quantidade, desconto = qtd_toras()
valor_transporte = transporte()

total = (valor_madeira * quantidade * (1 - desconto / 100)) + valor_transporte
print(f'Total a pagar: R$ {total:.2f}')
