local ffi = require("ffi")

ffi.cdef[[
  typedef struct { int y; } SimpleAnswer;
  typedef struct { int y; int* t; int z[10]; } ComplexAnswer;

  typedef struct { void *_this; } SimpleClass;

  SimpleClass *SimpleClass_SimpleClass();
  SimpleClass *SimpleClass_SimpleClass(const int);

  int SimpleClass_get(SimpleClass*);
  void SimpleClass_add(SimpleClass*, const int);
  void SimpleClass_subtract(SimpleClass*, const int);
  SimpleAnswer SimpleClass_getAnswer(SimpleClass*);
  ComplexAnswer SimpleClass_getArray(SimpleClass*);

]]

local mycode = ffi.load("shmylib")

local SimpleClass = mycode.SimpleClass_SimpleClass

local obj = SimpleClass()
mycode.SimpleClass_add(obj, 23)
mycode.SimpleClass_subtract(obj, 13)
print(mycode.SimpleClass_get(obj))

local a = mycode.SimpleClass_getAnswer(obj)
print(a.y)

local b = mycode.SimpleClass_getArray(obj)
for i = 1,b.y do
   io.write("\t" .. b.t[i])
end

print("\n")

for i = 1,10 do
   io.write("\t" .. b.z[i-1])
end

print("\n")
