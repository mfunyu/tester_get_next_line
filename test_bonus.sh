
make -s fclean

# define
CYAN="\033[1;36m"
RESET="\033[m"

printf "<<------------bonus----------------->>\n"

function test()
{
	printf "$CYAN[BUFFER_SIZE='$i']$RESET : \n"
	make -sB ARG=$i bonus 2> /dev/null
	./bonus txts/a txts/b txts/c
}

for ((i=0 ; i < 10; i++)); do
	test $i
done
for i in 32 1024 1025 9999 100000 10000000; do
	test $i
done
