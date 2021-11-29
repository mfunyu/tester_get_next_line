
make -s fclean

#FILES-------------------------------------------------------------------------------------

FILES=`ls -1 ./txts | grep ".txt"`
FLIELST=(${FILES// / })

for FILE in "${FLIELST[@]}"; do

printf "<<------------$FILE----------------->>\n"

#0-19-------------------------------------------------------------------------------------

for ((i=0 ; i < 19; i++)); do
	printf '\e[36;1m[BUFFER_SIZE='$i']\e[m'
	make -sB ARG=$i
	printf " :  "
	./exec txts/$FILE > results/ac$i.txt
	# ./exec txts/$FILE | ghead -c -1 > results/ac$i.txt
	diff -c results/ac$i.txt txts/$FILE >> log.txt
	if [ $? = 1 ]; then
		printf "\e[31;1m [KO] :(\e[m\n"
	else
		printf "\e[32;1m [OK] :)\e[m\n"
	fi
done

#any numbers-------------------------------------------------------------------------------------

ARGS=(
32
1024
1025
9999
100000
10000000
)

for i in "${ARGS[@]}"; do
printf '\e[36;1m[BUFFER_SIZE='$i']\e[m'
make -sB ARG=$i
printf " :  "
./exec txts/$FILE > results/ac$i.txt
# ./exec txts/$FILE | ghead -c -1 > results/ac$i.txt
# if [ $? = 0 ]; then
# 	printf "\e[33;1m error ;)\e[m\n"
# fi
diff -c results/ac$i.txt txts/$FILE >> log.txt
if [ $? = 1 ]; then
	printf "\e[31;1m [KO] :(\e[m\n"
else
	printf "\e[32;1m [OK] :)\e[m\n"
fi
done

#-------------------------------------------------------------------------------------
done

#STDinput-------------------------------------------------------------------------------------

printf "<<------------STD input----------------->>\n"

for i in "${ARGS[@]}"; do
printf '\e[36;1m[BUFFER_SIZE='$i']\e[m'
make -s ARG=$i re
printf " : \n"
./exec
done

printf "you can find diff results in log.txt\n"

# make -s clean
