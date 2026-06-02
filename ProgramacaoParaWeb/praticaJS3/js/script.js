//você vai atualizar esta página para que os formulários (login e cadastro) só apareçam quando necessário. Nesses casos (quando da apresentação de um formulário), 
// a presente descrição deve ficar oculta (mas poderá ser visível na home).
// e a descrição do exercício. Dê a eles um ID no seu HTML se ainda não tiverem.
const descricao = document.getElementById('divHome');
const formLogin = document.getElementById('login-body');
const formCadastro = document.getElementById('nova-conta');

// Passo 2: Ocultar os formulários usando a propriedade de estilo 'display'
// A propriedade 'display: none' do CSS faz o elemento desaparecer.
formLogin.style.display = 'none';
formCadastro.style.display = 'none';

// Passo 3: Adicionar os event listeners para os botões

// Primeiro, encontre os botões no DOM.
// O botão de Home e as opções "Fazer login" e "Criar conta"
// no menu do usuário.
const btnHome = document.getElementById('btn-home');    
const btnLogin = document.getElementById('btn-login');  
const btnCadastro = document.getElementById('btn-cadastro');

// No seu arquivo js/script.js

function mostrarApenasHome() {
  // Exibe a descrição e esconde os formulários
  divHome.style.display = 'block';
  loginBody.style.display = 'none';
  novaConta.style.display = 'none';
}

function mostrarApenasLogin() {
  // Esconde a descrição e o formulário de cadastro, exibe o de login
  divHome.style.display = 'none';
  loginBody.style.display = 'block';
  novaConta.style.display = 'none';
}

function mostrarApenasConta() {
  // Esconde a descrição e o formulário de login, exibe o de cadastro
  divHome.style.display = 'none';
  loginBody.style.display = 'none';
  novaConta.style.display = 'block';
}

// A função 'mostrarMenu' já existe em 'dropdown.js'
// e você não precisa reescrevê-la, pois ela cuida da funcionalidade
// do menu.

// Adicionar um evento de clique para o botão "Home"
btnHome.addEventListener('click', () => {
  // Lógica para a tela Home:
  // Mostre a descrição
  // Esconda os formulários
  descricao.style.display = 'block';
  formLogin.style.display = 'none';
  formCadastro.style.display = 'none';
});

// Adicionar um evento de clique para o botão "Fazer login"
btnLogin.addEventListener('click', () => {
    descricao.style.display = 'none';
    formLogin.style.display = 'block';
    formCadastro.style.display = 'none';
});

// Adicionar um evento de clique para o botão "Criar conta"
btnCadastro.addEventListener('click', () => {
  // Lógica para a tela de Cadastro:
  // Esconda a descrição
  // Esconda o formulário de login
  // Mostre o formulário de cadastro
  descricao.style.display = 'none';
  formLogin.style.display = 'none';
  formCadastro.style.display = 'block';
});