#ifndef FT_PRINTF_H
# define FT_PRINTF_H

// malloc, free
# include <stdlib.h>
// write
# include <unistd.h>
// va_start, va_arg, va_end, va_copy
# include <stdarg.h> 

# include <stdbool.h>

# include "../libft/libft.h"

// ft_printf.c
int	ft_puthexa_main(unsigned long n, bool is_upper);
int	ft_putnbr_main(long n, bool is_unsigned);
int	ft_putall(const char *str, va_list ap, int i);
int	ft_printf(const char *str, ...);

// ft_putall.c 
int	ft_putchar_count(char c);
int	ft_putstr_count(char *str);
int	ft_puthexa_count(unsigned long n, bool is_upper);

#endif