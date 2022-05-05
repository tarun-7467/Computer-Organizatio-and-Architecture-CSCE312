//
//  MatrixMultiplication.cpp
//  P7
//
//  Name: Tarun Arumugam
//  UIN: 530001455

#include "MatrixMultiplication.h"
#include <iostream>
#include <fstream>
using std::string;
using std::vector;
using std::ifstream;
using std::ofstream;
using std::cout;
using std::cin;

// void file_to_matrix(char* filename){
//     int rc;
//     vector<vector<int>> one;
//     vector<vector<int>> two;
//     vector<vector<int>> three;

//     cout << "Enter the file you would like to read from: ";
//     cin >> filename;
//     std::ifstream fin(filename);
//     if(fin.is_open()){
//         fin >> rc;
//         one.resize(rc);
//         two.resize(rc);
//         for(int i = 0; i < rc; i++){
//             for(int j = 0; j < rc; j++){
//                 one[i].push_back(fin);
//                 two[i].push_back(fin);
//             }
//         }
//     }
// }

void matrixMult1(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n) {
    // ijk
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            int sum = 0;
            for (int k = 0; k < n; k++) {
                sum += a[i][k] * b[k][j];
            }
            result[i][j] = sum;
        }
    }
}

void matrixMult2(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n) {
    // jik
    for (int j = 0; j < n; j++) {
        for (int i = 0; i < n; i++) {
            double sum = 0;
            for (int k = 0; k < n; k++) {
                sum += a[i][k] * b[k][j];
            }
            result[i][j] = sum;
        }
    }
}

void matrixMult3(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n){
    // kij
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            double r = a[i][k];
            for (int j = 0; j < n; j++) {
                result[i][j] += r * b[k][j];
            }
        }
    }
}

void blockingMatrixMult(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n, const int block_size) {
    // a = y, b = z, result = x
    for (int jj = 0; jj < n; jj += block_size) {
        for (int kk = 0; kk < n; kk += block_size) {
            for (int i = 0; i < n; i++) {
                for (int j = jj; j < std::min(jj+block_size-1, n); j++) {
                    int r = 0;
                    for (int k = kk; k < std::min(kk+block_size-1, n); k++) {
                        r += a[i][k] * b[k][j];
                    }
                    result[i][j] += r;
                }
            }
        }
    }
}
