#include "libftasm.h"
#include <unistd.h>
#include <stdio.h>


int main(int ac, char **av)
{
	int		ret;

	ret = ft_isalpha(av[1][0]);
	printf("IS_ALPHA : [%d]\n", ret);

	ret = ft_isdigit(av[1][0]);
	printf("IS_DIGIT : [%d]\n", ret);

	ret = ft_isalnum(av[1][0]);
	printf("IS_ALNUM : [%d]\n", ret);

	return (0);
}
