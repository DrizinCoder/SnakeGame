# Makefile para Assembly NASM

# Configurações
TARGET = main
ASM_SRC = main.asm
ASM_FLAGS = -f elf64
LD_FLAGS = 

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(ASM_SRC)
	@echo "Compilando $(ASM_SRC)..."
	nasm $(ASM_FLAGS) $(ASM_SRC) -o $(TARGET).o
	ld $(TARGET).o -o $(TARGET)
	@echo "Compilação concluída. Execute com: ./$(TARGET)"

run: $(TARGET)
	@echo "Executando programa..."
	./$(TARGET)

clean:
	@echo "Limpando arquivos gerados..."
	rm -f *.o $(TARGET)
