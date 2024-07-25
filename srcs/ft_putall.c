/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putall.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cfrancie <cfrancie@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/22 00:15:40 by cfrancie          #+#    #+#             */
/*   Updated: 2023/01/04 22:55:15 by cfrancie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/ft_printf.h"

int	ft_putchar_count(char c)
{
	return (write(1, &c, 1));
}

int	ft_putstr_count(char *str)
{
	int	i;

	if (!str)
	{
		write(1, "(null)", 6);
		return (6);
	}
	i = 0;
	while (str[i])
	{
		ft_putchar(str[i]);
		i++;
	}
	return (i);
}

int	ft_puthexa_count(unsigned long n, bool is_upper)
{
	char	*base;
	int		i;

	i = 0;
	base = "0123456789abcdef";
	if (is_upper)
		base = "0123456789ABCDEF";
	if (n >= 16)
		i += ft_puthexa_count(n / 16, is_upper);
	i += ft_putchar_count(base[n % 16]);
	return (i);
}
