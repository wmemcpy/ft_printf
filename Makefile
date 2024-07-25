NAME	= libftprintf.a

CC		= gcc
CLFAGS	= -Wall -Wextra -Werror

SRCS 	= ./srcs/
OBJS 	= ./objs/
LIB 	= ./libft/

CFILE	= ${SRCS}ft_printf.c ${SRCS}ft_putall.c
OFILE	= $(CFILE:$(SRCS)%.c=$(OBJS)%.o)

all: $(NAME)

$(NAME): $(OFILE)
	@make -C $(LIB)
	@cp $(LIB)/libft.a $(NAME)
	@ar rc $(NAME) $(OFILE)
	@ranlib $(NAME)

$(OBJS)%.o: $(SRCS)%.c
	@mkdir -p $(OBJS)
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo -e "\033[32m[`expr $$(expr $$(find $(OBJS) -name "*.o" | wc -l) \* 100) / $$(find $(SRCS) -name "*.c" | wc -l)`%]\033[0m Compilation de \033[33m$<\033[0m"

clean:
	@make clean -C $(LIB)
	@rm -rf $(OBJS)
	@echo -e "\033[31mSuppression des fichiers objets\033[0m"

fclean: clean
	@make fclean -C $(LIB)
	@rm -f $(NAME)
	@echo -e "\033[31mSuppression de $(NAME)\033[0m"

re: fclean all

.PHONY: all clean fclean re