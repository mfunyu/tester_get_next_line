# change VPATH depends on gnl directory's location #
VPATH	:= ..

NAME	:= exec
CC		:= gcc
CFLAGS	:= -Wall -Wextra -Werror -I$(VPATH) -D BUFFER_SIZE=$(ARG)

SRCS	:= gnl_main.c \
			get_next_line.c \
			get_next_line_utils.c
OBJS	:= $(SRCS:.c=.o)
BSRCS	:= gnl_main_bonus.c \
			get_next_line_bonus.c \
			get_next_line_utils_bonus.c
BOBJS	:= $(BSRCS:.c=.o)


TXT :=

all : $(NAME)

$(NAME) : $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

bonus : $(BOBJS)
	$(CC) $(CFLAGS) $^ -o $@

check :
	bash check.sh

clean :
	$(RM) $(NAME) bonus

fclean : clean
	$(RM) results/*.txt log.txt dbg_log.txt

re : clean all
