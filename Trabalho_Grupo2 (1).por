programa
{	
// Aqui onde incluímos a biblioteca em prol de usar para converter cadeia para inteiro!
// Embaixo dela, outra biblioteca de texto que usamos para extrair subtextos
	
	inclua biblioteca Tipos --> t
	inclua biblioteca Texto --> te
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> m

// Todas as nossas variáveis informadas pelo "TAMANHO" para se ouver alguma mudança,
// só mudarmos uma variável!
	const inteiro TAMANHO = 10 //altera o tamanho dos vetores TODOS
	cadeia nomeVetor[TAMANHO]
	cadeia cpfVetor[TAMANHO]
	real salarioBruto[TAMANHO]
	real horasTrab[TAMANHO]
	real salarioLiquido[TAMANHO]
	real somaHorasTrab = 0.0
	
	funcao inicio()
	{
// Usamos a "cadeia resposta = 1" enquanto "resposta != 0", pois, em nosso menu,
// o 0 significa sair do programa!		
		cadeia resposta = "1"
		inteiro respostaInteiro = 0		
		enquanto (resposta != "0")  //vai circular no loop enquanto "resposta" for diferente de 0
		{			
			escreva("\nEscolha:\n1- Cadastrar colaborador\n2- Editar dados de colaborador\n3- Registrar ponto\n4- Calcular folha de pagamento\n5- Exibir relatórios\n0- Sair\n")
			leia(resposta) //atribui o valor digitado à "resposta"
			se(t.cadeia_e_inteiro(resposta, 10) == verdadeiro)  //verifica se "resposta" é um número
			{
				respostaInteiro = t.cadeia_para_inteiro(resposta, 10) // transforma "resposta" em inteiro
			}senao {
				escreva("Comando inválido. \n") //Caso "resposta" não seja número
				u.aguarde(1200)
				}

			escolha (respostaInteiro) 
			{
				caso 0: 
				pare
// Se digitemos o número 0, o programa não dara continuidade
				caso 1: 
				cadastrarColaborador()
				pare
// Caso o digito for 1, ele irá chamar a função de cadastro do colaborador!

				caso 2: 
				editarDados()
				pare
// Como as vezes podemos cometer um erro, temos a opção de editar os dados pressionando 2!
				
				caso 3: 
				registrarPonto()
				pare
// Para registrar o ponto de entrada e saída, apenas digite o número 3

				caso 4:
				calcularPagamento()
				pare
// Em questões de calculo de pagamento, use o número 4!

				caso 5:
				exibirRelatorios()
// E se quiser o relatório, digite a tecla do 4!

				caso contrario:
// Caso use qualquer número acima ou igual a 6 ele não iniciará nada!				
			}
		} 
	}	
	
	funcao cadastrarColaborador() {
		cadeia nomeCadastro, cpfCadastro, salarioCadastro
// Aqui está descrito a função de cadastro, para que assim que dermos 
// o comando ele prossiguirá passo a passo nosso processo de cadastro!
		para (inteiro i = 0; i < TAMANHO; i++) 	// Vai rodar o loop enquanto i for menor que TAMANHO
		{			
			se(nomeVetor[i] == "") // Verifica se o indice do vetor de nomes está vazio, para atribuir um novo valor à ele e não substituir os já existentes!
			{
				// Se estiver vazio, ele pede as informações e registra nos devidos vetores!
				escreva("Digite o nome: \n")
				leia(nomeCadastro)
				nomeVetor[i] = nomeCadastro
	
				escreva("Digite o CPF: \n")
				leia(cpfCadastro)
				se (t.cadeia_e_inteiro(cpfCadastro, 10) == verdadeiro)	//verifica se foram digitados apenas números!
				{	
					cpfVetor[i] = cpfCadastro
				}senao 
				{
					escreva("Comando inválido.\n")
					u.aguarde(1200)
					pare
				}			
				
				escreva("Digite o salário: \n")
				leia(salarioCadastro)
				
				se (t.cadeia_e_real(salarioCadastro) == verdadeiro ou t.cadeia_e_inteiro(salarioCadastro, 10) == verdadeiro)  //verifica se o numero digitado é real OU inteiro
				{
					real salarioReal = t.cadeia_para_real(salarioCadastro) //transforma a variavel de cadeia para real!
					salarioBruto[i] = salarioReal //atribui o valor ao vetor de salario bruto!
				}senao {
					escreva("\nUse somente números separados por '.'\nTente cadastrar novamente.\n")
					u.aguarde(1200)
					pare
				// Com todas as informações ditadas, você está cadastrado!
				// Em nosso sitema, poderá desfrutar de uma série de opções incluindo a edição de registro, 
				// bater ponto (marcação de entrada e saída), contabilazação da folha de pagamento
				// e exibição dos relatórios!
				}							
				pare
			}
		}	
			se (nomeVetor[TAMANHO-1] != "")
			// Verifica se o ultimo indice do vetor está vazio, se não estiver, exibe a mensagem!
			{
				escreva("\nCadastro cheio. Não é possível cadastrar novos colaboradores.\n")
				u.aguarde(1200)
			}			
	}	
	funcao editarDados(){
		cadeia id	
		inteiro idReal	= -1
// Errou alguma letra do seu nome, cpf ou salário? sem problemas! Aqui oferecemos a opção de edição! 
// Através de um código simples baseado em sobreposição de variável			
		para (inteiro i = 0; i < TAMANHO; i++) {
			se(nomeVetor[i] != "")
			{
				escreva("ID: ", i, "\tNome: ", nomeVetor[i], "\tCpf: ", cpfVetor[i], "\tSalário bruto: ", salarioBruto[i], "\n")
			}//exibe uma lista dos vetores
		}

		escreva("Digite um ID: \n")
		leia(id)

		cadeia resposta = "1"
		
		// Aqui pesquisamos um ID! Cada colaborador tem o seu, facilitando a edição de dados!
		para (inteiro i = 0; i < TAMANHO; i++) {
			se(t.cadeia_e_inteiro(id, 10) == verdadeiro)
			{
				idReal = t.cadeia_para_inteiro(id, 10)				
			}senao {
				escreva("Digite um valor válido.")
				u.aguarde(1200)
				resposta = "0"
				pare
			}
			se(nomeVetor[idReal] == "")
			{
				escreva("Cadastro inexistente\n")
				u.aguarde(1200)
				resposta = "0"
				pare			
			}						
		}
		inteiro respostaInteiro = 0
		enquanto (resposta != "0") 
		{
			cadeia novoNome, novoCPF, novoSalario
						
			escreva("\nEscolha:\n1- Editar nome\n2- Editar cpf\n3- Editar salário\n0- Sair\n")
			leia(resposta)

			se(t.cadeia_e_inteiro(resposta, 10) == verdadeiro)
			//verifica se foram digitados apenas números
			{
				respostaInteiro = t.cadeia_para_inteiro(resposta, 10)	//transforma em inteiro
			}senao 
			{
				escreva("Comando inválido. \n")
				u.aguarde(1200)
			} 

			escolha (respostaInteiro)
			{
				caso 0:
					pare 
				
				caso 1:
					escreva("Nome atual: ", nomeVetor[idReal], ". Insira o novo nome: \n")
					leia(novoNome)
					nomeVetor[idReal] = novoNome	
					escreva("\nNome editado com sucesso.\n")
					u.aguarde(1200)// Substituimos o nome errado pelo certo!
					pare

				caso 2:
					// Oferecemos assim como a opção de Edição de nome, a de CPF também!
					// com o mesmo estilo de código através da sobreposição!				
					escreva("CPF atual: ", cpfVetor[idReal], ". Insira o novo CPF: \n")
					leia(novoCPF)	
					se (t.cadeia_e_inteiro(novoCPF, 10) == verdadeiro) // Verifica se foram digitados apenas números
					{
						cpfVetor[idReal] = novoCPF     
						escreva("\nCPF editado com sucesso.\n")
						u.aguarde(1200)								
					}senao 
					{
						escreva("Comando inválido.\n")
						u.aguarde(1200)
						pare
					}				
					pare			
					
				caso 3:
					escreva("Salário atual: ", salarioBruto[idReal], ". Insira o novo salário: \n")
					leia(novoSalario)
					// E se por acaso você errar seu salário, também editamos aqui mesmo!
					// Usando da mesma técnica para substituir o erro!
					
					se (t.cadeia_e_real(novoSalario) == verdadeiro ou t.cadeia_e_inteiro(novoSalario, 10) == verdadeiro)
					// Verifica se foram digitados apenas números
					{
						real novoSalarioReal = t.cadeia_para_real(novoSalario)
						salarioBruto[idReal] = novoSalarioReal
						escreva("\nSalário editado com sucesso.\n")
						u.aguarde(1200)						
					}senao {
						escreva("\nUse somente números separados por '.'\nCadastre novamente.\n")
						u.aguarde(1200)
						pare
					// E pronto! Tudo o que desejou editar está nos conformes!
					// Agora aproveite nosso sistema para cálculos e tire suas dúvidas!
					}
					pare
			}
		}
	}		

	funcao registrarPonto() {
		cadeia cpfColaborador
	// Nesse local do código, Registramos o ponto de entrada e saída do funcionário através do CPF!				
		escreva("Digite o CPF do colaborador: \n")
		leia(cpfColaborador)

		para(inteiro i = 0; i < TAMANHO; i++)  //varre a lista de qualquer vetor
		{						
			se(cpfVetor[i] == cpfColaborador) //verifica se algum indice do vetor de cpf corresponde ao digitado
			{				
				inteiro posicao = i	 //guarda a posicao do vetor em que está o cpf			
				cadeia entradaHora, saidaHora
				somaHorasTrab = horasTrab[posicao] //busca no vetor as horas e guarda numa variavel
				
				escreva("\nDigite a hora de entrada (Ex.: 09:30)\n")
				leia(entradaHora)
				
				real entradaH = 0.0
				real entradaM = 0.0
				se(te.numero_caracteres(entradaHora) == 5)
				{
					entradaH = separarHoras(entradaHora)				
					entradaM = separarMinutos(entradaHora)
				}senao {
					escreva("Entre com as horas no formato 00:00.")
					u.aguarde(1200)
					pare					
				}
					
				escreva("\nDigite a hora de saída (Ex.: 18:00)\n")					
				leia(saidaHora)
				
				real saidaH = separarHoras(saidaHora)
				real saidaM = separarMinutos(saidaHora)				
				real tempoEmMinutos = (saidaH * 60) + saidaM - (entradaH * 60) - entradaM	 //faz as contas dos minutos trabalhados		

				somaHorasTrab += tempoEmMinutos //soma os minutos acrescentados com os que já existiam no vetor
				horasTrab[posicao] = somaHorasTrab  //renova o valor do vetor com os novos minutos totais

				//Transforma os minutos totais trabalhados em horas e minutos
				real minutos = horasTrab[i]
				real horas = minutos / 60
				inteiro horasInteiro = t.real_para_inteiro(horas)
				real minutosFinal = (horas - horasInteiro)*60
				inteiro minFinalInteiro = t.real_para_inteiro(minutosFinal)
				escreva("Nome do colaborador: ", nomeVetor[i], "\tTempo trabalhado: ", horasInteiro, " horas e ", minFinalInteiro, " minutos\n")	//relatorio de horas trabalhadas
			}				
		}
	}

	funcao calcularPagamento() {
		inteiro i = 0
		real descontoInss, descontoIRRF
		enquanto (i < TAMANHO) {
			se(salarioBruto[i] <= 1412) {
				descontoInss = salarioBruto[i] * 0.075
			} senao se(salarioBruto[i] <= 2666.68) {
				descontoInss = salarioBruto[i] * 0.09
			} senao se(salarioBruto[i] <= 4000.03) {
				descontoInss = salarioBruto[i] * 0.12
			} senao se(salarioBruto[i] >= 4000.04) {
				descontoInss = salarioBruto[i] * 0.14
			} senao {
				descontoInss = 0.0
			}
	// Aqui também calculamos o desconto do INSS com um sistema de "SE", "SENAO" e "SENAO SE"!  
			se(salarioBruto[i] <= 2112) 
			{
				descontoIRRF = 0.0
			} senao se(salarioBruto[i] <= 2826.65) {
				descontoIRRF = salarioBruto[i] * 0.075
			} senao se(salarioBruto[i] <= 3751.05) {
				descontoIRRF = salarioBruto[i] * 0.15
			} senao se(salarioBruto[i] <= 4664.68) {
				descontoIRRF = salarioBruto[i] * 0.225
			}senao se(salarioBruto[i] > 4664.68) {
				descontoIRRF = salarioBruto[i] * 0.275
			}senao {
				descontoIRRF = 0.0
			}
	// E para cálculo do desconto IRRF usamos da mesma fórmula, apenas mudando os valores!			
			salarioLiquido[i] =  salarioBruto[i] - descontoInss - descontoIRRF
			se(nomeVetor[i] != "")
			{
				escreva("Nome do colaborador: ", nomeVetor[i], "\tSalário bruto: ", salarioBruto[i], "\tSalário líquido: ", m.arredondar(salarioLiquido[i], 2), "\n")
			} //relatorio de pagamento
			i++
		}		
			u.aguarde(1200)
	}
	
	funcao exibirRelatorios() { 
		inteiro i = 0
		enquanto(i < TAMANHO) {
			real minutos = horasTrab[i]
			real horas = minutos / 60
			inteiro horasInteiro = t.real_para_inteiro(horas)
			real minutosFinal = (horas - horasInteiro)*60
			inteiro minFinalInteiro = t.real_para_inteiro(minutosFinal)
			
			se (nomeVetor[i] != "")
			{
				escreva("\nNome do colaborador: ", nomeVetor[i], "\tCPF: ", cpfVetor[i],"\tTempo trabalhado: ", horasInteiro, " horas e ", minFinalInteiro, " minutos \tSalário bruto: ", salarioBruto[i])
			}
			// Aqui é a função em que exibimos os relatórios com nome, CPF, Salário Bruto, e salário líquido!			
			se (salarioLiquido[i] != 0.0) {
				escreva("\tSalário líquido: ", m.arredondar(salarioLiquido[i], 2), "\tDescontos totais: ", m.arredondar(salarioBruto[i] - salarioLiquido[i], 2), "\n") 
			}
			i++
		}
			u.aguarde(1200)			 
	}
	//Lê as horas e separa as horas
	funcao real separarHoras (cadeia hora){
		cadeia horas = te.extrair_subtexto(hora, 0, 2)
		real horasReal = t.cadeia_para_real(horas)	
		retorne horasReal
	}
	//Lê as horas e separa os minutos
	funcao real separarMinutos (cadeia hora){
		cadeia minutos = te.extrair_subtexto(hora, 3, 5)
		real minutosReal = t.cadeia_para_real(minutos)
		retorne minutosReal
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 12299; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */