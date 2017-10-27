#include "libfts.h"
#include <unistd.h>
#include <stdio.h>


int main(int ac, char **av)
{
	int		ret;

	if (ac > 1)
	{
		ret = ft_isalpha(av[1][0]);
		printf("IS_ALPHA : [%d]\n", ret);

		ret = ft_isdigit(av[1][0]);
		printf("IS_DIGIT : [%d]\n", ret);

		//ret = ft_isalnum(av[1][0]);
		//printf("IS_ALNUM : [%d]\n", ret);
	}	
	ft_puts(av[1]);
	return (puts(av[1]));
}
