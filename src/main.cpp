#include <iostream>

#include "SimpleClass.h"

int main(int argc, char *argv[]) {

  SimpleClass o = SimpleClass();
  o.add(23);
  o.subtract(13);
  std::cout << o.get() << std::endl;

  return 0;
}
