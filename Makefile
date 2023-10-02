# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlima-fe <rlima-fe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/27 16:46:05 by rlima-fe          #+#    #+#              #
#    Updated: 2023/10/02 15:31:30 by rlima-fe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap
CC = gcc -g
RM = rm -f
FLAGS = -Wall -Wextra -Werror
LIBFTDIR = libft/
OBJ_DIR = obj/
BONUS = checker
SRC_DIR = srcs/

RESET			:= \033[0m
GREEN			=	\e[32m
CYAN			:= \33[1;36m
YELLOW			=	\e[033m
BLUE			=	\e[34m
WHITE			=	\e[00m
RED				:= \033[1;31m

SRC_1 = ./push_swap.c					\

SRC_2 =	./algorithm/ft_sort_big.c		\
		./algorithm/ft_sort_three.c		\
		./functions/ft_add_back.c		\
		./functions/ft_check_dup.c		\
		./functions/ft_check_sorted.c	\
		./functions/ft_error_print.c	\
		./functions/ft_free.c			\
		./functions/ft_lst_create.c		\
		./functions/ft_stack_new.c		\
		./operations/operations.c		\
		./operations/operations_2.c		\
		./operations/operations_3.c		\
		./utils/ft_check_args.c			\
		./utils/ft_check_utils.c		\
		./utils/ft_rotate_and_push.c	\
		./utils/ft_rotate_type.c		\
		./utils/lst_find.c				\
		./utils/lst_utils.c				\
		./utils/solver_utils_ab.c		\
		./utils/solver_utils_ba.c		\

		
BONUS_SRC = ./bonus/checker.c					\
			./bonus/GNL/get_next_line.c			\
			./bonus/GNL/get_next_line_utils.c	\
			

OBJ_1 = ${SRC_1:.c=.o}
OBJ_2 = ${SRC_2:.c=.o}

BONUS_OBJ =${BONUS_SRC:.c=.o}

.c.o:
	${CC} -c $< -o ${<:.c=.o}

${NAME}: ${OBJ_1} ${OBJ_2}
	@echo "$(YELLOW)$(BOLD)Creating and compiling objects...$(RESET)"
	${CC} ${FLAGS} ${OBJ_1} ${OBJ_2} -o ${NAME}
	@echo "$(GREEN)$(BOLD)Objects created and compiled Master!$(RESET)"

${BONUS}: ${OBJ_2} ${BONUS_OBJ} 
	@echo "$(YELLOW)$(BOLD)Creating and compiling bonus files...$(RESET)"
	${CC} ${FLAGS} ${BONUS_OBJ} ${OBJ_2} -o ${BONUS}
	@echo "$(GREEN)$(BOLD)Bonus compiled daddy uwu$(RESET)"

all: ${NAME} ${BONUS}

bonus: ${BONUS} 

clean:
	@echo "$(YELLOW)$(BOLD)Removing objects!$(RESET)"
	${RM} ${OBJ_1} ${OBJ_2} ${BONUS_OBJ} ${NAME} ${BONUS}
	@echo "$(RED)$(BOLD)Objects removed!$(RESET)"

fclean: clean
	@echo "$(YELLOW)$(BOLD)Removing executables for you papa...!$(RESET)"
	${RM} ${NAME}
	@echo "$(RED)$(BOLD)Executables removed master >w<$(RESET)"
re: clean all

.SILENT:

.PHONY: all clean fclean re bonus