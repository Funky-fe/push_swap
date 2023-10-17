/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lst_create.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rlima-fe <rlima-fe@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/09/21 12:54:18 by rlima-fe          #+#    #+#             */
/*   Updated: 2023/10/17 16:43:27 by rlima-fe         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../push_swap.h"

// This function does three things.
// 1. It checks if the number of input is less than 2.
// 2. It checks if the number of input is equal to 2.
//    If it is, it means it is a quoted string.
// 3. It checks if the number of input is greater than 2.
//     If it is, it lists the arguements.
long	ft_atoi2(const char *str)
{
	int				mod;
	long long int	i;

	i = 0;
	mod = 1;
	while (*str == ' ' || *str == '\t' || *str == '\n')
		str++;
	if (*str == '-' || *str == '+')
	{
		if (*str == '-')
			mod = -1;
		str++;
	}
	if (*str == '\0')
		return (2147483649);
	while (*str)
	{
		if (!ft_isdigit(*str))
			return (2147483649);
		i = i * 10 + (*str - 48);
		str++;
	}
	if ((mod * i) > 2147483647 || (mod * i) < -2147483648)
		return (2147483649);
	return (mod * i);
}

t_stack	*ft_process(int argc, char **argv)
{
	t_stack		*a;
	long		i;
	long		j;

	i = 1;
	a = NULL;
	if (argc < 2)
		ft_error();
	else
	{
		while (i < argc)
		{
			j = ft_atoi2(argv[i]);
			if (j == 2147483649)
			{
				ft_free(&a);
				ft_error();
			}
			ft_add_back(&a, ft_stack_new(j));
			i++;
		}
	}
	return (a);
}
