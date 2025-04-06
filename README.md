# Desafio de Código Linux
# 💻 Infraestrutura como Código - Script de Criação de Usuários e Permissões

Este repositório contém um script Bash para **provisionamento automatizado de diretórios, grupos e usuários em sistemas Linux**, com permissões adequadas para cada departamento. O objetivo é aplicar os princípios de **Infraestrutura como Código (IaC)**, promovendo automação, consistência e reusabilidade do ambiente.

---

## 📂 Estrutura Criada

### Diretórios

- `/publico`
- `/adm`
- `/ven`
- `/sec`

### Grupos

- `GRP_ADM`
- `GRP_VEN`
- `GRP_SEC`

### Usuários

| Grupo     | Usuários                       |
|-----------|--------------------------------|
| GRP_ADM   | carlos, maria, joao            |
| GRP_VEN   | debora, sebastiana, roberto    |
| GRP_SEC   | josefina, amanda, rogerio      |

---

## 🔒 Permissões

| Diretório | Dono  | Grupo      | Permissões |
|-----------|-------|------------|-------------|
| /publico  | root  | root       | `777` - Acesso total a todos |
| /adm      | root  | GRP_ADM    | `770` - Somente membros do grupo |
| /ven      | root  | GRP_VEN    | `770` - Somente membros do grupo |
| /sec      | root  | GRP_SEC    | `770` - Somente membros do grupo |

---

## ⚙️ Funcionalidades do Script

- Remove previamente estruturas existentes (diretórios, usuários e grupos)
- Cria diretórios e define proprietário como `root`
- Cria grupos e adiciona usuários aos respectivos grupos
- Define senhas padrões criptografadas
- Configura permissões conforme exigido
- Inclui validações e mensagens de log
- Idempotente: evita recriação desnecessária de usuários ou grupos

---

## ✅ Requisitos

- Distribuição Linux (testado no Ubuntu e CentOS/RHEL)
- Execução como **usuário root**
- `openssl` instalado (para gerar senhas criptografadas)

---

## 🚀 Como Executar

Clone o repositório e execute o script:

```bash
git clone https://github.com/SEU_USUARIO/desafio-de-codigo-linux.git
cd desafio-de-codigo-linux
sudo ./provisionamento_infra.sh

