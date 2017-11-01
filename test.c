#include "libfts.h"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#include <fcntl.h>

int main(int ac, char **av)
{
	int		ret;

	if (ac > 1)
	{
		// =============  FT_IS  =============
		ret = ft_isalpha(av[1][0]);
		printf("IS_ALPHA(%c) : [%d]\n", av[1][0], ret);

		ret = ft_isdigit(av[1][0]);
		printf("IS_DIGIT(%c) : [%d]\n", av[1][0], ret);

		ret = ft_isalnum(av[1][0]);
		printf("IS_ALNUM(%c) : [%d]\n", av[1][0], ret);

		ret = ft_isascii(av[1][0]);
		printf("IS_ASCII(%c) : [%d]\n", av[1][0], ret);

		ret = ft_islower(av[1][0]);
		printf("IS_LOWER(%c) : [%d]\n", av[1][0], ret);

		ret = ft_isupper(av[1][0]);
		printf("IS_UPPER(%c) : [%d]\n", av[1][0], ret);
	}

	// =============  FT_PUTS  =============
	printf("PUTS(%s) :\n", av[1]);
	ft_puts(av[1]);

	{
		char *str = NULL;
		char *str2 = NULL;

		asprintf(&str, "%s", "ABCDEFGHIJ");
		asprintf(&str2, "%s", "ZYXWVUTSR");

		// =============  FT_BZERO =============
		printf("\nBZERO(%s, 5):\n", str);
		ft_bzero(str, 5);
		for (int i = 0; i < 10; i++)
			printf("[%c]", *(str + i));
		printf("\n");

		// =============  FT_MEMSET =============
		printf("\nMEMSET(%s, '0', 9):\n", str);
		ft_memset(str, '0', 9);
		for (int i = 0; i < 10; i++)
			printf("[%c]", *(str + i));
		printf("\n");

		// =============  FT_MEMCPY =============
		printf("\nMEMCPY(%s, %s, 3) :\n", str, str2);
		printf("%s\n", ft_memcpy(str, str2, 3));

		// =============  FT_STRDUP =============
		printf("\nSTRDUP(%s) : %s\n", str2, ft_strdup(str2));

		char *str3 = malloc(10 + ft_strlen(str2) + 1);
		for (int i = 0; i < 9; i++)
			str3[i] = 'a' + i;
		str3[9] = '\0';

		// =============  FT_STRCAT =============
		printf("\nSTRCAT(%s, %s) :\n", str3, str2);
		printf("%s\n", ft_strcat(str3, str2));
	}

	// =============  FT_CAT =============
	{
		int fd = open("./auteur", O_RDONLY);
		printf("\nFT_CAT(%d)\n", fd);
		ft_cat(fd);
		close(fd);
	}


	printf("\n=======  BONUS :  =======\n");
	//======= TEA_ENCRYPT / DECRYPT ==========
	
	{
		uint32_t	msg[2] = {42, 31};
		uint32_t	key[4] = {23423, 32131, 81723, 1231};
		printf("\nMSG : [%d] [%d]\n", msg[0], msg[1]);
		tea_encrypt(msg, key);
		printf("\nENCRYPTED MSG : [%d] [%d]\n", msg[0], msg[1]);
		tea_decrypt(msg, key);
		printf("\nDECRYPTED MSG : [%d] [%d]\n", msg[0], msg[1]);
	}

	//============ FT_PUTSTR ================
	printf("\nFT_PUTSTR(\"toto\"):\n");
	ft_putstr("toto");
	printf("\nFT_PUTSTR(NULL):\n");
	ft_putstr(NULL);

	//========== FT_PUTSTR_FD ================
	printf("\nFT_PUTSTR_FD(\"ERR\", 2):\n");
	ft_putstr_fd("ERR", 2);

	//========== FT_PUTCHAR ================
	printf("\nFT_PUTCHAR(42):\n");
	ft_putchar(42);

	return (0);
}
