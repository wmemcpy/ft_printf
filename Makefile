NAME		= libftprintf.a

CC			= gcc
CFLAGS	= -Wall -Wextra -Werror

SRCS		= ./srcs/
OBJS		= ./objs/
LIB		 = ./libft/

CFILE	 = ${SRCS}ft_printf.c ${SRCS}ft_putall.c
OFILE	 = $(CFILE:$(SRCS)%.c=$(OBJS)%.o)

all: $(NAME)

$(NAME): $(OFILE)
	@make -C $(LIB)
	@cp $(LIB)/libft.a $(NAME)
	@ar rc $(NAME) $(OFILE)
	@ranlib $(NAME)

$(OBJS)%.o: $(SRCS)%.c
	@mkdir -p $(OBJS)
	@$(CC) $(CFLAGS) -c $< -o $@
	@printf "\033[32m[%d%%]\033[0m Compilation de \033[33m%s\033[0m\n" $(shell expr $$(expr $$(find $(OBJS) -name "*.o" | wc -l) \* 100) / $$(find $(SRCS) -name "*.c" | wc -l)) $<

clean:
	@make clean -C $(LIB)
	@rm -rf $(OBJS)
	@printf "\033[31mSuppression des fichiers objets\033[0m\n"

fclean: clean
	@make fclean -C $(LIB)
	@rm -f $(NAME)
	@printf "\033[31mSuppression de %s\033[0m\n" $(NAME)

re: fclean all

.PHONY: all clean fclean re
