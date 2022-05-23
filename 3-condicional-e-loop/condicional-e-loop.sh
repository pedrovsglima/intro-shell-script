#!/bin/bash

invokedValue=$1

isNumberRegex="^[0-9]+$"

if [[ ${invokedValue} =~ ${isNumberRegex} ]]; then

	# verifica se o parâmetro informado ao invocar o script é maior que 2
	if [[ ${invokedValue} -gt 2 ]]; then
 		
		# criar pastas, se necessário
    		mkdir -p backup_par backup_impar
    
    		# para cada iteração, invocar comando top e salvar resultado no .log correspondente
    		for ((i=1; i<=${invokedValue}; i++)); do
			
			file=iteracao-$i.log

    			top -n 1 > ${file}
        
			# replicar arquivos de iteração par para a pasta backup_par
			if [[ $((i%2)) -eq 0 ]]; then
				cp ${file} ./backup_par
	
			# replicar arquivos de iteração impar para a pasta backup_impar
			else
 				cp ${file} ./backup_impar
			fi
		done
    
    		# juntar as duas pastas em um arquivo tarball chamado backup_par_impar
    		tar -cf backup_par_impar.tar ./backup_impar ./backup_par

	else
    		echo "Fim. Valor menor que 2."
	fi
else
	echo "Erro. Informe um número."
fi
