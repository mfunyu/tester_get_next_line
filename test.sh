
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

error=0

function test()
{
	printf "<<------------ %s ----------->>\n" "BUFFER_SIZE=$1"
	make -sB ARG=$1 2> /dev/null

	for FILE in "${FLIELST[@]}"; do
		printf "${CYAN}[%-20s]${RESET} :  " $FILE
		./exec txts/$FILE > results/ac$1.txt
		if [ $1 = 0 ]; then
			diff -c results/ac$1.txt txts/empty.txt >> log.txt
		else
			diff -c results/ac$1.txt txts/$FILE >> log.txt
		fi
		if [ $? = 1 ]; then
			printf "${RED} [KO] :(${RESET}\n"
			error=$((error + 1))
		else
			printf "${GREEN} [OK] :)${RESET}\n"
		fi
	done
}

for ((i=0 ; i <= 10; i++)); do
	test $i
done
for i in "${ARGS[@]}"; do
	test $i
done

if [ $error = 0 ]; then
	printf "\n${GREEN}[ Perfect! ] :)${RESET}\n"
else
	printf "\nyou can find diff results in log.txt\n"
fi

