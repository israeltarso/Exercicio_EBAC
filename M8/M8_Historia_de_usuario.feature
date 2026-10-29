# language: pt

########## CASO 1 - Selecionar produto ##########

Funcionalidade: EBAC-SHOP - Selecionar produto
    Como cliente da EBAC-SHOP
    Quero configurar meu produto de acordo com meu tamanho e gosto
    E escolher a quantidade
    Para depois inserir no carrinho

Contexto:
    Dado que estou na página de seleção do produto do site da EBAC

Cenário: Seleções de cor, tamanho e quantidade devem ser obrigatórios
    Quando seleciono o tamanho "M"
    E seleciono a cor "Vermelho"
    E informo a quantidade 2
    E clico no botão "Comprar"
    Então o produto deve ser inserido no carrinho

Cenário: Não permitir adicionar ao carrinho sem selecionar tamanho, cor e quantidade
    Quando não seleciono o tamanho nem a cor e nem a quantidade
    E clico no botão "Comprar"
    Então o produto não deve ser inserido no carrinho
    E deve exibir um alerta informando:  "Concluir a  seleção das opções obrigatórias *"


Cenário: Validar o limite de 10 produtos por venda
    Quando seleciono o tamanho "M"
    E seleciono a cor "Vermelho"
    E informo a quantidade <quantidade>
    E clico no botão "Comprar"
    Então o resultado deve ser <resultado>

Exemplos:
    | quantidade | resultado                                               |
    | 1          | produto inserido no carrinho                            |
    | 9          | produto inserido no carrinho                            |
    | 10         | produto inserido no carrinho                            |
    | 11         | produto não inserido e alerta de máximo de 10 por venda |
    | 20         | produto não inserido e alerta de máximo de 10 por venda |


Cenário: Limpar seleções retorna a configuração ao estado original
    Quando seleciono o tamanho "M"
    E seleciono a cor "Vermelho"
    E informo a quantidade 5
    Quando clico no botão "Limpar"
    Então nenhum tamanho deve estar selecionado
    E nenhuma cor deve estar selecionada
    E a quantidade deve voltar a zero '0'


########## CASO 2 - Login ##########

Funcionalidade: EBAC-SHOP - Login
    Como cliente da EBAC-SHOP
    Quero fazer o login (autenticação) na plataforma
    Para visualizar meus pedidos

Dado que estou na página de login "Minha Conta"

Cenário: Login com dados válidos
    Quando informo um usuário válido
    E informo uma senha válida
    E clico no botão "Login"
    Então deve ser direcionado para a tela de checkout


Cenário: Login com usuário e/ou senha inválidos
    Quando informo o usuário <usuario>
    E informo a senha <senha>
    E clico no botão "Login"
    Então deve exibir um alerta informando:  "Usuário ou senha inválidos"
    E não deve ser direcionado para a tela de checkout

Exemplos:
    | usuario                    | senha          |
    | usuario.valido@ebac.com    | senhaErrada123 |
    | usuario.invalido@ebac.com  | senhaValida123 |
    | usuario.invalido@ebac.com  | senhaErrada123 |


########## CASO 3 - Checkout ##########

Funcionalidade: EBAC-SHOP - Checkout
    Como cliente da EBAC-SHOP
    Quero concluir meu cadastro
    Para finalizar minha compra

Dado que estou na tela de checkout com produtos no carrinho

Cenário: Concluir cadastro com todos os campos obrigatórios preenchidos
    Quando preencho todos os campos obrigatórios (marcados com asterisco)
    E clico no botão "Finalizar compra"
    Então o cadastro deve ser concluído com sucesso
    E a compra deve ser finalizada

Cenário: Não permitir e-mail com formato inválido
    Quando preencho todos os campos obrigatórios (marcados com asterisco)
    E informo o e-mail <email>
    E clico no botão "Finalizar compra"
    Então deve exibir um alerta informando: "E-mail inválido"
    E o cadastro não deve ser concluído

Exemplos:
    | email                 |
    | usuario               |
    | usuario@              |
    | usuario@dominio       |
    | @dominio.com          |
    | usuario@dominio..com  |
    | usuario dominio@x.com |


Cenário: Exibir alerta ao deixar campo obrigatório vazio
    Quando preencho os campos obrigatórios (marcados com asterisco)
    E deixo o campo <campo> vazio
    E clico no botão "Finalizar compra"
    Então deve exibir um alerta informando:  "Preencher todos os campos obrigatórios"
    E o cadastro não deve ser concluído

Exemplos:
    | campo     |
    | Nome      |
    | Sobrenome |
    | País      |
    | Endereço  |
    | Cidade    |
    | CEP       |
    | Telefone  |
    | E-mail    |
