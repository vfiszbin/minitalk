# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vfiszbin <vfiszbin@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/20 19:36:03 by vfiszbin          #+#    #+#              #
#    Updated: 2022/02/11 10:55:05 by vfiszbin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FT_PRINTF = libftprintf.a

SERVER = server

CLIENT = client

CC = gcc
RM = rm -f

FLAGS = -Wall -Wextra -Werror

all: ${FT_PRINTF} ${SERVER} ${CLIENT}

%.o : %.c
	$(CC) $(FLAGS) $< -c

${FT_PRINTF}:
	${MAKE} -C ./ft_printf
	
$(SERVER) : server.o
	${CC} server.o ft_printf/libftprintf.a -o server

$(CLIENT) : client.o client_utils.o
	${CC} client.o client_utils.o ft_printf/libftprintf.a -o client


clean:
	${MAKE} clean -C ./ft_printf
	${RM} server.o
	${RM} client.o
	${RM} client_utils.o

fclean: clean
	${MAKE} fclean -C ./ft_printf
	${RM} ${SERVER}
	${RM} ${CLIENT}

re: fclean all

.PHONY: all clean fclean re