# ?= --> A
# := --> B
# =  --> C
# 三者的优先级从小到大排序: '?=' < '=' < ':='
#
# @符号的作用: 隐藏命令语句的打印, 命令悄无声息的运行

all: usage A B C

usage:   
	@echo "'?=' ':=' '=' assignment symbol test"

# ?= 可以被'='和':='重载(覆盖),但是不能被'?='重载, mk文件内覆盖优先级低于命令行make传入的参数覆盖的优先级
# ?= 在mk中定义的变量, 不论变换多少次, 都会被make 命令行传入参数覆盖掉
OS ?= linux
OS += freebsd
A:
	@echo "OS="${OS}

# := 可以被'='和':='重载(覆盖),但是不能被'?='重载, mk文件内覆盖优先级低于命令行make传入的参数覆盖的优先级
#
CPP := g++
CPP += clang++
B:
	@echo "C++="${CPP}

# = 可以被'='和':='重载(覆盖),但是不能被'?='重载, mk文件内覆盖优先级低于命令行make传入的参数覆盖的优先级
#
LIB = QT
LIB ?= boost
C:
	@echo "LIB="${LIB}
