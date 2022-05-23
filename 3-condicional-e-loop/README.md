# Estruturas condicional e de repetição

1. Criar um script que registre uma quantidade informada ao invocar o script e que seja maior que 2;

2. Garantir que o parâmetro informado ao invocar o script trata-se de um inteiro;
	```
	invokedValue=$1

	isNumberRegex="^[0-9]+$"

	if [[ ${invokedValue} =~ ${isNumberRegex} ]]; then

	...

	fi
	```

3. No caso de número menor de iterações, informar que nada será executado e terminar a execução;
	```
	if [[ ${invokedValue} -gt 2 ]]; then

	...

	fi
	```

4. O parâmetro de entrada determinará o número de iterações do comando top e também será utilizado para salvar os resultados em arquivos que respeitam a nomenclatura: iteracao-<numero_da_iteração>.log
	```
	for ((i=1; i<=${invokedValue}; i++)); do

		file=iteracao-$i.log

 		top -n 1 > ${file}

	 	...

	done
	```

5. No final, replicar os arquivos de iteração ímpar para uma pasta chamada backup_impar e os de numeração par para uma pasta chamada backup_par;
	```
	mkdir -p backup_par backup_impar

	if [[ $((i%2)) -eq 0 ]]; then

	...

	fi
	```
6. Após isso, juntar as duas pastas em um arquivo tarball chamado backup_par_impar.
	```
	tar -cf backup_par_impar.tar ./backup_impar ./backup_par
	```
