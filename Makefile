##
## EPITECH PROJECT, 2023
## MAKEFILE
## File description:
## Makefile
##

NAME		=	pushswap_checker

CPPFLAGS	=	-W -Wall -Wextra

SRC_DIR		=	src/

SRCS		=	$(SRC_DIR)Pushswap_checker.hs	\

all: $(NAME)
	@echo "Build ok!"

$(NAME):
	ghc -o $(NAME) $(SRCS) $(CPPFLAGS)

clean:
	$(RM) $(SRC_DIR)*.o
	$(RM) $(SRC_DIR)*.hi
	@echo "Clean ok!"

fclean:	clean
	$(RM) $(NAME)
	@echo "Fclean ok!"

re:	fclean all

.PHONY: all clean fclean re
