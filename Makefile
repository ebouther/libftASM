# **************************************************************************** ##                                                                              # #                                                         :::      ::::::::    # #    Makefile                                           :+:      :+:    :+:    # #                                                     +:+ +:+         +:+      # #    By: ebouther <marvin@42.fr>                    +#+  +:+       +#+         # #                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/15 15:20:41 by ebouther          #+#    #+#              #
#    Updated: 2017/09/26 20:20:52 by ebouther         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UNAME := $(shell uname)

NAME = libfts.a
AS = nasm 

ifeq ($(UNAME), Linux)
    ASFLAGS = -f elf64 -g
else
    ASFLAGS = -f macho64 -g
endif


LDFLAGS = 

TEST_DIR = test/
SRC_DIR = src/
OBJ_DIR = obj/

SRC_FILES = ft_isalpha.s \
			ft_isdigit.s \
			ft_isalnum.s \
			ft_isascii.s \
			ft_isprint.s \
			ft_strlen.s \
			ft_strcmp.s

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

check:
	make -C $(TEST_DIR) check

.PHONY: all clean fclean re
