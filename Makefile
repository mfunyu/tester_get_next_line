# change VPATH depends on gnl directory's location #
VPATH	:= ..

SRCS	:= gnl_main.c \
			get_next_line.c \
			get_next_line_utils.c
BONUS	:= gnl_main_bonus.c \
			get_next_line_bonus.c \
			get_next_line_utils_bonus.c

CC := gcc
CFLAGS := -Wall -Wextra -Werror -I$(VPATH)

TXT :=
NAME := test

all : $(NAME)

$(NAME) : $(SRCS)
	$(CC) $(CFLAGS) -D BUFFER_SIZE=$(ARG) $^ -o $@

bonus : $(BONUS)
	$(CC) $(CFLAGS) -D BUFFER_SIZE=$(ARG) $^ -o $@

check :
	bash check.sh

clean :
	$(RM) $(NAME) bonus

fclean : clean
	$(RM) results/*.txt log.txt dbg_log.txt

re : clean all
