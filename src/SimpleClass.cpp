#include "SimpleClass.h"

// Class methods

SimpleClass::SimpleClass(const int x) : _x { x } {
  std::cout << "Constructor" << std::endl;
}

SimpleClass::SimpleClass() : SimpleClass(0) { }

int SimpleClass::get() const {
  std::cout << "Get" << std::endl;
  return this->_x;
}

void SimpleClass::add(const int z) {
  std::cout << "Add" << std::endl;
  this->_x += z;
}

void SimpleClass::subtract(const int z) {
  std::cout << "Subtract" << std::endl;
  this->_x -= z;
}

// C functions

SimpleClass *SimpleClass_SimpleClass() {
  return new SimpleClass();
}

SimpleClass *SimpleClass_SimpleClass_arg(const int x) {
  return new SimpleClass(x);
}

int SimpleClass_get(SimpleClass *_this){
  return _this->get();
}

void SimpleClass_add(SimpleClass* _this, int z){
  _this->add(z);
}

void SimpleClass_subtract(SimpleClass* _this, int z){
  _this->subtract(z);
}
