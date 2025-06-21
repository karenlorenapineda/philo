NAME	= philo
CC		= gcc
CFLAGS	= -Werror -Wall -Wextra -pthread

MODE	= none
ifeq ($(MODE), pretty)
	CFLAGS += -D DEBUG_FORMATTING=1
endif

SRC_PATH = sources/
OBJ_PATH = objects/

SRC		=	main.c \
			parsing.c \
			grim_reaper.c \
			time.c \
			philosopher.c \
			init.c \
			output.c \
			exit.c
SRCS	= $(addprefix $(SRC_PATH), $(SRC))
OBJ		= $(SRC:.c=.o)
OBJS	= $(addprefix $(OBJ_PATH), $(OBJ))

INC		= -I ./includes/

all: $(NAME)

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@mkdir -p $(OBJ_PATH)
	$(CC) $(CFLAGS) -c $< -o $@ $(INC)

$(NAME): $(OBJS)
	@echo "\033[38;2;255;47;187m"
	@echo "        _      _ _                       _                   "
	@echo "       | |    |_| |                     | |                  "
	@echo "  _ __ | |__   _| | ___  ___  ___  _ __ | |__   ___ _ __ ___ "
	@echo " |  _ ||  _  || | || _ || __|| _ ||  _ ||  _  || _ |  __| __|"
	@echo " | |_||| | | || | |||_|||__ |||_||| |_||| | | || __| |  |__ |"
	@echo " |  __||_| |_||_|_||___||___||___||  __||_| |_||___|_|  |___|"
	@echo " | |                              | |                        "
	@echo " | |                              | |                        "
	@echo " |_|                              |_|                        "
	@echo "\033[0m"

	$(CC) $(CFLAGS)	$(OBJS) -o $@
	@echo "\033[0;32m▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄ Compilación completada. ▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄\033[0m"


clean:
	rm -rf $(OBJ_PATH)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all re clean fclean