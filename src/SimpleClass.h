#ifndef SIMPLE_CLASS_H
#define SIMPLE_CLASS_H

#include <iostream>

class SimpleClass {

public:
  SimpleClass();
  SimpleClass(const int);
  int get() const;
  void add(const int);
  void subtract(const int);

private:
  int _x;

};

extern "C" {

  SimpleClass *SimpleClass_SimpleClass();
  SimpleClass *SimpleClass_SimpleClass_arg(const int);

  int SimpleClass_get(SimpleClass*);

  void SimpleClass_add(SimpleClass*, const int);
  void SimpleClass_subtract(SimpleClass*, const int);
}

#endif
