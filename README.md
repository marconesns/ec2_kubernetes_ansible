# Instâncias EC2

## Baixando o Repositório `ec2_kubernetes_ansible` do GitHub

Para baixar o repositório mencionado do GitHub, você precisa ter o `git` instalado em seu computador. Se você ainda não o tem, pode instalar facilmente visitando o site oficial do Git: [Git Downloads](https://git-scm.com/downloads).

Após garantir que o Git está instalado, siga os passos abaixo:

### 1. Abra o Terminal ou Prompt de Comando
Dependendo do seu sistema operacional, você usará o Terminal (Linux ou MacOS) ou o Prompt de Comando (Windows).

### 2. Navegue até o Diretório Desejado
Decida onde você deseja baixar o repositório e navegue até lá. Por exemplo, se você deseja baixar na pasta Documentos, faça:

```bash
cd ~/Documentos
```

### 3. Clone o Repositório
Agora, use o comando `git clone` seguido do URL do repositório:

```bash
git clone https://github.com/marconesns/ec2_kubernetes_ansible.git
```

O Git começará a baixar todos os arquivos do repositório para a sua máquina. Após a conclusão, uma nova pasta chamada `ec2_kubernetes_ansible` será criada no diretório atual, contendo todos os arquivos e pastas do repositório.

### 4. Acesse a Pasta do Repositório
Para navegar até a pasta recém-criada, use:

```bash
cd ec2_kubernetes_ansible
```

Agora você está dentro do diretório do repositório e pronto para começar a trabalhar com os arquivos.
## Preparação da Chave SSH

Para inicializar as instâncias EC2, primeiro, você precisa gerar um par de chaves RSA. Este par será usado para acessar as instâncias EC2 de forma segura.

1. **Gerar Chave SSH:** Utilize o comando `ssh-keygen` para criar um par de chaves. O exemplo a seguir usa "ck-prod" como nome base para as chaves:

```bash
$ ssh-keygen -f ec2/curso/ec2-key -t rsa -N ""
```

Aqui, `ec2-key` será a chave privada e `ec2-key.pub` será a chave pública. Se você optar por um nome diferente, será necessário ajustar o arquivo de variáveis no Terraform:

2. **Atualizar Variáveis (se necessário):** Edite o arquivo `ec2/curso/main.tf`. Procure por `chave` e substitua o valor pelo nome base da chave escolhida.

## Provisionando as Instâncias

Siga os passos a seguir para criar as instâncias EC2 usando Terraform:

1. **Inicializar o Terraform:** No diretório `ec2/curso`, execute o comando abaixo para carregar os módulos do Terraform:

```bash
$ terraform init
```

2. **Verificar Pendências:** Execute o `plan` do Terraform para identificar possíveis pendências ou erros:

```bash
$ terraform plan
```

3. **Criar Instâncias:** Agora, você pode criar as instâncias executando:

```bash
$ terraform apply
```

Responda com `yes` quando solicitado.

Este comando provisionará três instâncias EC2: uma `master` e duas `workers`. Ao concluir, o Terraform mostrará um `output` contendo os IPs públicos atribuídos a cada instância. Anote esses IPs; você precisará deles para configurar o inventário do Ansible.

Caso precise visualizar esses IPs novamente, use:

```bash
$ terraform output
```

# Criando o Cluster k8s

Após o provisionamento das instâncias, você pode começar a instalação do Kubernetes.

1. **Verificar o Estado do Cluster:** Use o comando abaixo para verificar se o cluster foi inicializado corretamente:

```bash
$ kubectl get nodes
```

Se todos os nodes aparecerem com o status `Running`, significa que tudo foi configurado corretamente e seu cluster Kubernetes está ativo!