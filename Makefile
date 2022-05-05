all: clean main.cpp MatrixMultiplication.cpp MatrixMultiplication.h
	mkdir build
	g++ -std=c++11 MatrixMultiplication.cpp -c -o build/MatrixMultiplication.o
	g++ -std=c++11 main.cpp -c -o build/main.o
	g++ -std=c++11 build/main.o build/MatrixMultiplication.o -o main
    
clean:
	rm -rf main build
