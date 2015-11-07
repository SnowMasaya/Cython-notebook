def py_fact(n):
    if n <= 1:
        return 1
    return n * py_fact(n - 1)

def typed_fact(long n):
    if n <= 1:
        return 1
    return n * typed_fact(n - 1)

def wrap_c_fact(n):
    return c_fact(n)

cdef long c_fact(long n):
    if n <= 1:
        return 1
    return n * c_fact(n - 1)

cpdef long cp_fact(long n):
    if n <= 1:
        return 1
    return n * cp_fact(n - 1)

cpdef int divide_ints(int i, int j) except? -1:
    return i / j

def cast_to_list(a):
    cdef list cast_list = <list>a
    print(type(a))
    print(type(cast_list))
    cast_list.append(1)

def safe_cast_to_list(a):
    cdef list cast_list = <list?>a
    print(type(a))
    print(type(cast_list))
    cast_list.append(1)

ctypedef struct mycpx:
    float real
    float imag 

ctypedef union uu:
    int a
    short b, c 

cdef mycpx a = mycpx(3.1415, -1.0)
cdef mycpx b = mycpx(real=2.718, img=1.618034)

cdef mycpx zz = {"real": 3.1415, "img": -1.0}
