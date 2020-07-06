

SRC_DIR := ../get_next_line1

CC := gcc
# CFLAGS := -Wall -Wextra -Werror -g -fsanitize=address
CFLAGS := -Wall -Wextra -Werror -g
SRCS := gnl_main.c ${SRC_DIR}/get_next_line.c ${SRC_DIR}/get_next_line_utils.c
BONUS := gnl_main_bonus.c ${SRC_DIR}/get_next_line_bonus.c ${SRC_DIR}/get_next_line_utils_bonus.c
TXT :=
NAME := test

all : ${NAME}

${NAME} : ${SRCS}
	${CC} ${CFLAGS} -D BUFFER_SIZE=${ARG} $^ -o $@

bonus : ${BONUS}
	${CC} ${CFLAGS} -D BUFFER_SIZE=${ARG} $^ -o $@

check :
	bash check.sh

clean :
	${RM} ${NAME} bonus

fclean : clean
	${RM} results/*.txt log.txt dbg_log.txt

re : clean all
