# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebouther <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/15 15:20:41 by ebouther          #+#    #+#              #
#    Updated: 2017/11/01 17:29:35 by ebouther         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UNAME := $(shell uname)

NAME = libfts.a
AS = nasm 

ifeq ($(UNAME), Linux)
    ASFLAGS = -f elf64
else
    ASFLAGS = -f macho64
endif


LDFLAGS = 

TEST_DIR = test/
SRC_DIR = src/
OBJ_DIR = obj/
INC_DIR = inc/

SRC_FILES =   ft_bzero.s   	\
			 ft_strcat.s  	\
			 ft_isalpha.s  	\
			 ft_isdigit.s  	\
			 ft_isalnum.s  	\
			 ft_isascii.s  	\
			 ft_isprint.s  	\
			 ft_toupper.s  	\
			 ft_tolower.s  	\
			  ft_puts.s   	\
			 ft_strlen.s   	\
			 ft_memset.s   	\
			 ft_memcpy.s   	\
			 ft_strdup.s   	\
			  ft_cat.s 	  	\
			tea_encrypt.s 	\
			tea_decrypt.s 	\
			 ft_putstr.s 	\
			ft_putstr_fd.s  \
			ft_putchar.s
 
OBJ_FILES = $(SRC_FILES:.s=.o)

SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))



all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR) 

$(OBJ_DIR)%.o : $(SRC_DIR)%.s
	$(AS) $(ASFLAGS) $< -o $@

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

check: $(NAME)
	make -C $(TEST_DIR) check

test: test.c $(NAME)
	gcc	-I $(INC_DIR) $(NAME) test.c && ./a.out

.PHONY: all clean fclean re
