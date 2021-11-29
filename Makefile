# change VPATH depends on gnl directory's location #
VPATH	:= ..

NAME	:= exec
CC		:= gcc
CFLAGS	:= -Wall -Wextra -Werror -I$(VPATH) -D BUFFER_SIZE=$(ARG)

SRCS	:= gnl_main.c \
			get_next_line.c \
			get_next_line_utils.c
OBJS_DIR:= objs/
OBJS	:= $(addprefix $(OBJS_DIR), $(SRCS:.c=.o))
BSRCS	:= gnl_main_bonus.c \
			get_next_line_bonus.c \
			get_next_line_utils_bonus.c
BOBJS	:= $(addprefix $(OBJS_DIR), $(BSRCS:.c=.o))


TXT :=

all : $(NAME)

$(NAME) : $(OBJS_DIR) $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJS_DIR)%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJS_DIR):
	@-mkdir $@

bonus : $(BOBJS)
	$(CC) $(CFLAGS) $^ -o $@

check :
	bash check.sh

clean :
	$(RM) $(NAME) bonus

fclean : clean
	$(RM) -R $(OBJS_DIR) results/*.txt *.txt

re : clean all
