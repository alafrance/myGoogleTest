NAME			= gTest

FILES			= hello_test.cpp
INC_FILES		= .
INC_PATH		= .
INC				= $(addprefix ${INC_PATH}/, ${INC_FILES})

SRC_PATH		= .
SRC				= $(addprefix ${SRC_PATH}/, ${FILES})

BIN_PATH		= bin
BIN 			= $(SRC:%.cpp=$(BIN_PATH)/%.o)

GTEST_SRC 		= googletest
GTEST_INC 		= googletest/googletest/include/
GTEST_LIB		= $(addprefix build/lib/, libgtest.a libgtest_main.a)

CXX				= clang++
RM				= rm -rf
FLAGS			= -Wall -Wextra  -Werror --std=c++11

all: 			${NAME}
				clear
				@./${NAME}


initGtest:
				@cmake -S ${GTEST_SRC} -B build
				@cmake --build build

init: initGtest
				@$(shell mkdir -p $(BIN_PATH))


$(BIN): $(BIN_PATH)/%.o: %.cpp ${INC}
				@mkdir -p $(@D)
				@$(CXX) $(FLAGS) -I ${INC_PATH} -I ${GTEST_INC} -o $@ -c $<
				@printf "\e[?25l\e[JGTEST  : \e[92m$(notdir $<)\e[0m\r"

${NAME}: 		init ${BIN}
				@${CXX} ${FLAGS} ${BIN} -o ${NAME} -I ${INC_PATH} -I ${GTEST_INC} ${GTEST_LIB}
				@printf '\033[?25l\033[JGTEST CREATED \033[92m✔ \033[0m\033[?25h\n'

clean:
				@${RM} ${BIN_PATH}
				@${RM} build
				@printf '\033[?25l\033[JGTEST DELETED \033[92m✔ \033[0m\033[?25h\n'

fclean:	clean
				@${RM} ${NAME}

re:				fclean all

.PHONY: all clean fclean re
