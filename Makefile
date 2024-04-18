# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: del-ganb <del-ganb@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/23 14:48:40 by del-ganb          #+#    #+#              #
#    Updated: 2024/04/14 19:48:37 by del-ganb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CNAME = client
SNAME = server

CSRC = client.c
SSRC = server.c

COBJS = $(CSRC:.c=.o)
SOBJS = $(SSRC:.c=.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror

RM = rm -rf

all: $(CNAME) $(SNAME)

$(SNAME): $(SOBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(CNAME): $(COBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(COBJS): $(CSRC)
	$(CC) $(CFLAGS) -c $< -o $@

$(SOBJS): $(SSRC)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(COBJS) $(SOBJS)

fclean: clean
	$(RM) $(SNAME) $(CNAME)

re: fclean all

.PHONY: all clean fclean re
