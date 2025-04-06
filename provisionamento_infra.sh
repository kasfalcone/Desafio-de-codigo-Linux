#!/bin/bash

# ===================================================
# Script de Provisionamento de Infraestrutura como Código
# ===================================================
# Descrição: Cria diretórios, grupos, usuários e define permissões de acesso
# Autor: Kémellyn Falcone
# ===================================================

# === Função para remover estruturas existentes ===
limpar_estruturas() {
    echo "Removendo diretórios existentes..."
    rm -rf /publico /adm /ven /sec

    echo "Removendo grupos existentes..."
    groupdel GRP_ADM 2>/dev/null
    groupdel GRP_VEN 2>/dev/null
    groupdel GRP_SEC 2>/dev/null

    echo "Removendo usuários existentes..."
    userdel -r carlos 2>/dev/null
    userdel -r maria 2>/dev/null
    userdel -r joao 2>/dev/null
    userdel -r debora 2>/dev/null
    userdel -r sebastiana 2>/dev/null
    userdel -r roberto 2>/dev/null
    userdel -r josefina 2>/dev/null
    userdel -r amanda 2>/dev/null
    userdel -r rogerio 2>/dev/null
}

# === Função para criar diretórios ===
criar_diretorios() {
    echo "Criando diretórios..."
    mkdir /publico /adm /ven /sec
    chown root:root /publico /adm /ven /sec
}

# === Função para criar grupos ===
criar_grupos() {
    echo "Criando grupos..."
    groupadd GRP_ADM
    groupadd GRP_VEN
    groupadd GRP_SEC
}

# === Função para criar usuários e adicioná-los aos grupos ===
criar_usuarios() {
    echo "Criando usuários do GRP_ADM..."
    useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
    useradd maria  -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
    useradd joao   -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

    echo "Criando usuários do GRP_VEN..."
    useradd debora      -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
    useradd sebastiana  -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
    useradd roberto     -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

    echo "Criando usuários do GRP_SEC..."
    useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
    useradd amanda   -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
    useradd rogerio  -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
}

# === Função para configurar permissões dos diretórios ===
configurar_permissoes() {
    echo "Configurando permissões dos diretórios..."

    chmod 777 /publico

    chown root:GRP_ADM /adm
    chmod 770 /adm

    chown root:GRP_VEN /ven
    chmod 770 /ven

    chown root:GRP_SEC /sec
    chmod 770 /sec
}

# === Função principal ===
main() {
    echo "Iniciando provisionamento da infraestrutura..."

    limpar_estruturas
    criar_diretorios
    criar_grupos
    criar_usuarios
    configurar_permissoes

    echo "Provisionamento concluído com sucesso!"
}

# === Execução do script ===
main

