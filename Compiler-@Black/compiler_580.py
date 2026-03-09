import os
def compile_file(filename):
    compiler_path = "./580vnx/compiler_.py"
    asm_path = f"./580vnx_ropchain/{filename}.asm"
    if not os.path.exists(asm_path):
        print("File doesn't exist.")
        return
    command = f'python {compiler_path} -f hex < {asm_path}'
    os.system(command)
def main():
    while True:
        os.system('cls' if os.name == 'nt' else 'clear')
        filename = input("Black đây.Nổ cho tao tên file : ").strip()
        compile_file(filename)
        print("\nXong rồi đó mày, còn thì đập phím nhắc tao")
        print("\nKhông thì lượn ở đây ăn ba vạn à :v")
        input()

if __name__ == "__main__":
    main()