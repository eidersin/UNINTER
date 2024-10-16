"""
Calcula o valor mensal do plano de acordo com a idade do cliente.

Parâmetros:
- idade (int): Idade do cliente
- valorBase (float): Valor base do plano

Retorno:
- float: Valor mensal atualizado com base na idade do cliente
"""
def valorMensal(idade, valorBase):
    if idade >= 0 and idade < 19:
        return valorBase
    elif idade >= 19 and idade < 29:
        return (valorBase * 150) / 100
    elif idade >= 29 and idade < 39:
        return (valorBase * 225) / 100
    elif idade >= 39 and idade < 49:
        return (valorBase * 240) / 100
    elif idade >= 49 and idade < 59:
        return (valorBase * 350) / 100
    else:
        return (valorBase * 600) / 100

# Exibe mensagem de boas-vindas ao sistema
print('Bem vindo ao sistema do WANDERSON TEIXEIRA SOUSA')

while True:  # Loop para solicitar as entradas até que sejam válidas
    try:
        valorBase = float(input('Informe o valor base do plano: '))  # Solicita ao usuário o valor base do plano e converte para float
        while valorBase < 0:  # Verifica se o valor base é negativo, e solicita novamente caso seja
            print('Valor base inválido. O valor deve ser positivo.')
            valorBase = float(input('Informe o valor base do plano: '))

        idade = int(input('Informe a idade do cliente: '))  # Solicita ao usuário a idade do cliente e converte para inteiro
        while idade < 0:  # Verifica se a idade é negativa, e solicita novamente caso seja
            print('Idade inválida, digite novamente.')
            idade = int(input('Informe a idade do cliente: '))

        # Calcula e exibe o valor mensal do plano com base na idade e valor base
        print(f'O valor mensal do plano é de: R$ {valorMensal(idade, valorBase):.2f}')
        break  # Encerra o loop quando as entradas são válidas

    # Captura exceções de entrada inválida e solicita ao usuário que insira valores numéricos
    except ValueError:
        print('Entrada inválida. Por favor, insira um número válido.')

