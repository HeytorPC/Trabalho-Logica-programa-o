# Trabalho-Logica-programa-o

# Programa de Departamento Pessoal em Portugol

Este repositório contém um projeto de um sistema de Departamento Pessoal, desenvolvido para fins acadêmicos. O sistema permite o cadastro de colaboradores, controle de ponto, cálculo da folha de pagamento, e geração de relatórios completos.

## Funcionalidades

### 1. Cadastro de Colaboradores
Permite o cadastro de colaboradores com as seguintes informações:
- Nome
- CPF
- Salário

Os dados dos colaboradores são armazenados em vetores para fácil manipulação e consulta.

### 2. Folha de Pagamento
Calcula e exibe a folha de pagamento dos colaboradores cadastrados. O cálculo do salário líquido é feito subtraindo os descontos do INSS e IRRF, conforme as alíquotas progressivas:

#### INSS
- **Faixa 1:** Até R$ 1.412,00 - 7,5%
- **Faixa 2:** De R$ 1.412,01 até R$ 2.666,68 - 9%
- **Faixa 3:** De R$ 2.666,69 até R$ 4.000,03 - 12%
- **Faixa 4:** Acima de R$ 4.000,04 - 14%

#### IRRF
- **Faixa 1:** Até R$ 2.112,00 - Isento
- **Faixa 2:** De R$ 2.112,01 até R$ 2.826,65 - 7,5%
- **Faixa 3:** De R$ 2.826,66 até R$ 3.751,05 - 15%
- **Faixa 4:** De R$ 3.751,06 até R$ 4.664,68 - 22,5%
- **Faixa 5:** Acima de R$ 4.664,68 - 27,5%

O sistema exibe o nome do colaborador, salário bruto, valores dos descontos e o salário líquido.

### 3. Controle de Ponto
Permite o registro de ponto dos colaboradores, armazenando horários de entrada e saída. O sistema:
- Registra os horários de entrada e saída de cada colaborador, identificado pelo CPF.
- Calcula as horas trabalhadas com base na diferença entre a hora de entrada e a hora de saída.
- Exibe relatórios detalhados de horas trabalhadas para cada colaborador.

### 4. Relatórios
Gera um relatório completo que inclui:
- Dados dos colaboradores cadastrados.
- Folha de pagamento detalhada.
- Registros de ponto, incluindo horas trabalhadas.
