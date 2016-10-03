#ifndef SIMPLE_CLASS_H
#define SIMPLE_CLASS_H

#include <iostream>

extern "C" {
  struct SimpleAnswer {
    int _y;
  };

  struct ComplexAnswer {
    int _y;
    int* _t;
    int _z[10];
  };
}

class SimpleClass {

public:
  SimpleClass();
  SimpleClass(const int);
  int get() const;
  void add(const int);
  void subtract(const int);

  SimpleAnswer getAnswer() const;
  ComplexAnswer getArray() const;

private:
  int _x;

};

extern "C" {

  SimpleClass *SimpleClass_SimpleClass();
  SimpleClass *SimpleClass_SimpleClass_arg(const int);

  int SimpleClass_get(SimpleClass*);

  void SimpleClass_add(SimpleClass*, const int);
  void SimpleClass_subtract(SimpleClass*, const int);

  SimpleAnswer SimpleClass_getAnswer(SimpleClass*);
  ComplexAnswer SimpleClass_getArray(SimpleClass*);

}

#endif
