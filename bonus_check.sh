
make -s fclean

printf "<<------------bonus----------------->>\n"

#0-19-------------------------------------------------------------------------------------

for ((i=0 ; i < 10; i++))
do
printf '\e[36;1m[BUFFER_SIZE='$i']\e[m'
make clean -s ARG=$i bonus
printf " : \n"
./bonus txts/a txts/b txts/c
done

#any numbers-------------------------------------------------------------------------------------

for i in 32 1024 1025 9999 100000 10000000
do
printf '\e[36;1m[BUFFER_SIZE='$i']\e[m'
make clean -s ARG=$i bonus
printf " : \n"
./bonus txts/a txts/b txts/c
done


#STDinput-------------------------------------------------------------------------------------

printf "<<------------STD input----------------->>\n"

for i in 32 1024 1025 9999 100000 10000000
do
printf '\e[36;1m[BUFFER_SIZE='$i']\e[m'
make clean -s ARG=$i bonus
printf " : \n"
./bonus
done

# make -s clean
