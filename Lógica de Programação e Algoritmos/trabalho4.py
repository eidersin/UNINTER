def valida_int(pergunta, min, max=None):
    """
    Função para validar a entrada do usuário, garantindo que seja um inteiro dentro de um intervalo.
    
    :param pergunta: A pergunta a ser exibida ao usuário.
    :param min: O valor mínimo permitido.
    :param max: O valor máximo permitido (opcional).
    :return: Retorna um número inteiro válido.
    """
    
    while True:
        try:
            x = int(input(pergunta))
            if x < min:
                print(f"Por favor, insira um valor maior ou igual a {min}.")
            elif max is not None and x > max:
                print(f"Por favor, insira um valor entre {min} e {max}.")
            else:
                return x  # Retorna o valor válido
        except ValueError:
            print("Entrada inválida. Por favor, insira um número válido.")

# Lista para armazenar contatos
lista_contatos = [] 
id_global = 2412021  # Meu ID ALUNO (ID INICIAL PARA CADASTRO)

def cadastrar_contato(id):
    """
    Função para cadastrar um novo contato.
    
    :param id: O ID do novo contato.
    """

    # Pergunta informações do contato
    print(f'Id do Contato: {id_global}')
    nome = input('Por favor entre com o nome do Contato: ')
    atividade = input('Por favor entre com a Atividade do contato: ')
    telefone = input('Por favor entre com o telefone do contato: ')
    
    contato = {
        'id': id,
        'nome': nome,
        'atividade': atividade,
        'telefone': telefone
    }
    lista_contatos.append(contato.copy())  # Adiciona contato à lista
    print('Cadastro feito com sucesso...')

def consultar_contatos():
    """
    Função para consultar contatos cadastrados.
    """
    while True:
        print(20 * '-' + ' MENU CONSULTAR CONTATO ' + 20 * '-')
        item_escolha = valida_int('Escolha a opção desejada: \n1 - Consultar Todos os Contatos\n2 - Consultar Contato por id\n3 - Consultar Contato(s) por Atividade\n4 - Retornar\nQual escolha: ', 1, 4)
        
        if item_escolha == 1:
            listar_contatos()
        elif item_escolha == 2:
            id_contato = valida_int('Digite o Id do contato: ', 1)
            listar_contato_por_id(id_contato)
        elif item_escolha == 3:
            atividade_contato = input('Digite a Atividade do contato: ')
            listar_contatos_por_atividade(atividade_contato)
        elif item_escolha == 4:
            print('Retornando ao menu principal...\n')
            return  # Retorna ao menu principal
        else:
            print('Opção inválida.')

def listar_contatos():
    """
    Função para listar todos os contatos cadastrados.
    """
    if not lista_contatos:
        print('Nenhum contato cadastrado.')
    else:
        for contato in lista_contatos:
            print(f"Id: {contato['id']}\nNome: {contato['nome']}\nAtividade: {contato['atividade']}\nTelefone: {contato['telefone']}\n")

def listar_contato_por_id(id_contato):
    """
    Função para listar um contato específico pelo ID.
    
    :param id_contato: O ID do contato a ser listado.
    """
    for contato in lista_contatos:
        if contato['id'] == id_contato:
            print(f'Id: {contato["id"]}\nNome: {contato["nome"]}\nAtividade: {contato["atividade"]}\nTelefone: {contato["telefone"]}\n')
            return
    print(f'Contato com Id {id_contato} não encontrado.')

def listar_contatos_por_atividade(atividade_contato):
    """
    Função para listar contatos com base na atividade.
    
    :param atividade_contato: A atividade que será usada para filtrar os contatos.
    """
    encontrou = False
    for contato in lista_contatos:
        if contato['atividade'] == atividade_contato:
            print(f'Id: {contato["id"]}\nNome: {contato["nome"]}\nAtividade: {contato["atividade"]}\nTelefone: {contato["telefone"]}\n')
            encontrou = True
    if not encontrou:
        print(f'Nenhum contato encontrado com a atividade "{atividade_contato}".')

def remover_contato():
    """
    Função para remover um contato da lista.
    """
    id_contato = valida_int('Digite o Id do contato que deseja remover: ', 1)
    for contato in lista_contatos:
        if contato['id'] == id_contato:
            lista_contatos.remove(contato)
            print(f'Contato com Id {id_contato} removido com sucesso.')
            return
    print(f'Contato com Id {id_contato} não encontrado.')

def menu():
    """
    Função para exibir o menu principal do programa.
    """
    print(64 * '-')
    print(24 * '-' + ' MENU PRINCIPAL ' + 24 * '-')
    print('Escolha a opção desejada:')
    print('1 - Cadastrar Contato')
    print('2 - Consultar Contato')
    print('3 - Remover Contato')
    print('4 - Sair')
    print(64 * '-')

# Início do programa
print('\nBem-vindo à Lista de Contatos do Wanderson Teixeira')
while True:
    menu() # Exibe o menu principal
    item_menu = valida_int('Escolha qual item do menu: ', 1, 4)
    print()
    if item_menu == 4:
        print('Encerrando o programa...')
        break # Encerra o programa
    elif item_menu == 1: 
        print(20 * '-' + ' MENU CADASTRAR CONTATO ' + 20 * '-')
        id_global += 1  # Incrementa o ID global para o próximo contato
        cadastrar_contato(id_global) # Chama a função para cadastrar um novo contato

    elif item_menu == 2:
        consultar_contatos() # Chama a função para consultar contatos

    elif item_menu == 3:
        print(20 * '-' + ' MENU REMOVER CONTATO ' + 20 * '-')
        remover_contato() # Chama a função para remover um contato
