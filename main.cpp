//
//  main.cpp
//  P7
//
//  Name: Tarun Arumugam
//  UIN: 530001455

#include "MatrixMultiplication.h"
using std::string;
using std::vector;
using std::ifstream;
using std:: ofstream;
#include <iostream>
#include <fstream>
#include <string>
using std::cout;
using std::endl;

vector<int> read_helper(string rc) {
  vector<int> temp;
  string num = "";
  for (int i = 0; i < rc.length(); i++) {
    if (rc[i] == ' ') {
      temp.push_back(stoi(num));
      num = "";
    } else {
      num += rc[i];
    }
  }
  if (num != " " && num != ""){
    temp.push_back(stoi(num));
  }

  return temp;
}

int main(int argc, const char * argv[]) {
    long double duration;
    clock_t start;
    clock_t end;
    
    // File Read Operation
    ifstream fin(argv[1]);
    int rc;
    string line;
    vector<vector<int> > one;
    vector<vector<int> > two;

    if (fin.is_open()) {
        getline(fin, line);
        rc = stoi(line);

        getline(fin, line);

        for (int i = 0; i < rc; i++) {
            getline(fin, line);
            vector<int> row = read_helper(line);
            one.push_back(row);
        }

        getline(fin, line);

        for (int i = 0; i < rc; i++) {
            getline(fin, line);
            vector<int> row = read_helper(line);
            two.push_back(row);
        }


        fin.close();
    } 
    else {
        cout << "Couldn't open file" << endl;
        return -1;
    }
    
    // Matrix Mult 1
    vector<vector<int> > result1(rc, vector<int>(rc, 0));
    start = std::clock();
    matrixMult1(one, two, result1, rc);
    end = std::clock();
    duration = (end - start) / (long double)CLOCKS_PER_SEC;
    std::cout << "First matrix mult took:                 " << duration << " seconds.\n\n";
    
    // Matrix Mult 2
    vector<vector<int> > result2(rc, vector<int>(rc, 0));
    start = std::clock();
    matrixMult2(one, two, result2, rc);
    end = std::clock();
    duration = (end - start) / (long double)CLOCKS_PER_SEC;
    std::cout << "Second matrix mult took:                 " << duration << " seconds.\n";
    
    // Matrix Mult 3
    vector<vector<int> > result3(rc, vector<int>(rc, 0));
    start = std::clock();
    matrixMult3(one, two, result3, rc);
    end = std::clock();
    duration = (end - start) / (long double)CLOCKS_PER_SEC;
    std::cout << "Third matrix mult took:                     " << duration << " seconds.\n";
    
    // Matrix Mult Blocking
    for (int i = 10; i <= rc; i += (rc / 10)) {
        vector<vector<int> > temp(rc, vector<int>(rc, 0));
        start = std::clock();
        blockingMatrixMult(one, two, temp, rc, i);
        end = std::clock();
        duration = (end - start) / (long double)CLOCKS_PER_SEC;
        std::cout << "Matrix mult (with blocking of size " << i << ") took:  " << duration << " seconds.\n";
    }
    
    return 0;
}
