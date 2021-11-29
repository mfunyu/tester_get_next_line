
make -s fclean

# define
CYAN="\033[36m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
RESET="\033[m"

FILES=`ls -1 ./txts | grep ".txt"`
FLIELST=(${FILES// / })

ARGS=(
32
1024
1025
9999
100000
10000000
)

function test()
{
	printf "${CYAN}[BUFFER_SIZE='$1']${RESET} :  "
	make -sB ARG=$1
	./exec txts/$FILE > results/ac$1.txt
	# ./exec txts/$FILE | ghead -c -1 > results/ac$1.txt
	# if [ $? = 0 ]; then
	# 	printf "\e[33;1m error ;)${RESET}\n"
	# fi
	diff -c results/ac$1.txt txts/$FILE >> log.txt
	if [ $? = 1 ]; then
		printf "${RED} [KO] :(${RESET}\n"
	else
		printf "${GREEN} [OK] :)${RESET}\n"
	fi
}

for FILE in "${FLIELST[@]}"; do
	printf "<<------------$FILE----------------->>\n"

	for ((i=0 ; i < 19; i++)); do
		test $i
	done
	for i in "${ARGS[@]}"; do
		test $i
	done
done

printf "<<------------STD input----------------->>\n"

for i in "${ARGS[@]}"; do
	printf "${CYAN}[BUFFER_SIZE=$i]${RESET} :  \n"
	make -s ARG=$i re
	./exec
done

printf "you can find diff results in log.txt\n"

