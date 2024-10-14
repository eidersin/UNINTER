# Função para obter um número válido do usuário
def obter_numero(numero_dia: str) -> int:
    while True:
        try:
            numero = int(input(numero_dia))
            return numero
        except ValueError:
            print("Entrada inválida. Por favor, digite um número.")

# Pede um número ao usuário
numero = obter_numero("\n1 - Domingo\n2 - Segunda-feira\n3 - Terça-feira\n4 - Quarta-feira\n5 - Quinta-feira\n6 - Sexta-feira\n7 - Sábado\nDigite um número para escolher o dia da semana: ")

# Verifica o número e imprime o dia correspondente
if numero == 1:
    print("Dia escolhido: Domingo")
elif numero == 2:
    print("Dia escolhido: Segunda-feira")
elif numero == 3:
    print("Dia escolhido: Terça-feira")
elif numero == 4:
    print("Dia escolhido: Quarta-feira")
elif numero == 5:
    print("Dia escolhido: Quinta-feira")
elif numero == 6:
    print("Dia escolhido: Sexta-feira")
elif numero == 7:
    print("Dia escolhido: Sábado")
else:
    print("Valor inválido.")
