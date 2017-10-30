#ifndef LIBFTS_H 
# define LIBFTS_H

#include <stddef.h> 

void	ft_bzero(void *s, size_t n);
// ft_strcat
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_puts(const char *s);

size_t	ft_strlen(const char *s);
void	*ft_memset(void *b, int c, size_t len);

//int 	ft_strcmp(const char *s1, const char *s2);

#endif
