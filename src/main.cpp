#include <iostream>

#include "SimpleClass.h"

int main(int argc, char *argv[]) {

  SimpleClass o = SimpleClass();
  o.add(23);
  o.subtract(13);
  std::cout << o.get() << std::endl;

  SimpleAnswer a = o.getAnswer();
  std::cout << a._y << std::endl;

  ComplexAnswer b = o.getArray();
  for (int i = 0; i < b._y; i++) {
    std::cout << "\t" << b._t[i];
  }
  std::cout << std::endl;
  for (int i = 0; i <= 9; i++) {
    std::cout << "\t" << b._z[i];
  }
  std::cout << std::endl;

  return 0;
}
