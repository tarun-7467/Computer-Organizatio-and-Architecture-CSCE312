//
//  MatrixMultiplication.h
//  P7
//
//  Name: Tarun Arumugam
//  UIN: 530001455

#include <iostream>
#include <vector>

#ifndef MatrixMultiplication_h
#define MatrixMultiplication_h

void matrixMult1(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n);

void matrixMult2(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n);

void matrixMult3(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n);

void blockingMatrixMult(const std::vector<std::vector<int> >& a, const std::vector<std::vector<int> >& b, std::vector<std::vector<int> >& result, const int n, const int block_size);

#endif /* MatrixMultiplication_h */
