local ffi = require("ffi")

ffi.cdef[[
  typedef struct { void *_this; } SimpleClass;

  SimpleClass *SimpleClass_SimpleClass();
  SimpleClass *SimpleClass_SimpleClass(const int);

  int SimpleClass_get(SimpleClass*);
  void SimpleClass_add(SimpleClass*, const int);
  void SimpleClass_subtract(SimpleClass*, const int);
]]

local mycode = ffi.load("shmylib")

local SimpleClass = mycode.SimpleClass_SimpleClass;

local obj = SimpleClass()
mycode.SimpleClass_add(obj, 23)
mycode.SimpleClass_subtract(obj, 13)
print(mycode.SimpleClass_get(obj))
mycode.SimpleClass_add(obj, 5)
