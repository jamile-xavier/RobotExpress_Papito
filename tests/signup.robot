*** Settings ***
Documentation    Cenários de testes do cadastro de usuários

Library    Browser
Library    FakerLibrary

Resource     ../resources/base.resource   

Suite Setup    Log     Tudo aqui ocorre antes da Suite(antes de todos os testes)
Suite Teardown    Log     Tudo aqui ocorre depois da Suite(depois de todos os testes)

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Variables ***
${name}    Fernando Papito
${email}    papito@yahoo.com.br
${password}    pwd123

*** Test Cases ***
Deve poder cadastrar um novo usuário

    ${user}    Create Dictionary     
    ...    name= Fernando Papito
    ...    email= papito@yahoo.com.br
    ...    password= pwd123


    Remove user from database    ${user}[email]

    Go to signup page
    Submit signup form    ${user}
    Notice should be    Boas vindas ao Mark85, o seu gerenciador de tarefas

Não deve permitir o cadastro com email duplicado
    [Tags]    dup

     ${user}    Create Dictionary     
    ...    name= Papito Fernando
    ...    email= fernando@yahoo.com.br
    ...    password= pwd123
   
    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    
    Go to signup page
    Submit signup form    ${user}
    Notice should be    Oops! Já existe uma conta com o e-mail informado.
   
   
