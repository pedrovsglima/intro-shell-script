# Crontab

1. Desenvolver um script que escreve em um log separado por horário os processos que mais estão consumindo recursos do Sistema Operacional;

2. Registrar execução em um crontab para rodar a cada 10 minutos durante o dia.

	crontab -e
	
	*/10 * * * * \<full-path\>/crontab.sh
