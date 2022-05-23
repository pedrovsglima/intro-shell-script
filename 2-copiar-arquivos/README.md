# Copiar arquivos

Requisito: Descrever cada etapa no console;
1. Na primeira etapa, o programa deve criar dois arquivos com os nomes de log1.txt e log2.txt;
	echo "criando arquivos"
	touch log1.txt log2.txt
2. Armazene o conteúdo do comando ls-lha dentro do log1.txt;
	echo "arquivo log1"
	ls -lha > log1.txt
3. Armazene o conteúdo do comando top dentro do log2.txt;
	echo "arquivo log2"
	top -n 5 > log2.txt
4. Crie uma pasta chamada backup_logs;
	echo "criando diretorio"
	mkdir -p backup_logs
5. Realizar uma cópia destes dois arquivos para dentro da pasta backup_logs;
	echo "copiando arquivos"
	cp log1.txt log2.txt ./backup_logs
6. No final, informar que a atividade foi concluída com sucesso;
	echo "done"
7. Tornar o arquivo executável;
	chmod +x atividade-copiar-arquivos.sh
8. Executar o arquivo
	./atividade-copiar-arquivos.sh