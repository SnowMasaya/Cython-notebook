from cython cimport integral
cimport cython
from cpython cimport array

cdef integral integral_max(integral a, integral b):
    return a if a >= b else b

cdef allowed():
    print(integral_max(<short>1, <short>2))
    print(integral_max(<int>1, <int>2))
    print(integral_max(<long>1, <long>2))

ctypedef fused integral_or_floating:
    cython.short
    cython.int
    cython.long
    cython.float
    cython.double

def call_allow():
    allowed()

a_list = [1.0, 2.0, 3.0]
cpdef integral_or_floating generic_max(integral_or_floating a,
                                       integral_or_floating b):
    cdef array.array a_list2 = array.array('d', a_list)
    cdef unsigned int i, n = len(a_list2) - 1 
    for i in range(1, n):
        a_list2[i] = (a_list2[i - 1] + a_list2[i] + a_list2[i + 1]) / 3.0
    print(a_list2)
    return a if a >= b else b
