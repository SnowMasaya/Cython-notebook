ctypedef double real
ctypedef long integral
def integrate(a, b, f):
    ctypedef struct mycpx:
        float real
        float imag
    ctypedef union uu:
        int a
        short b, c
    cdef: 
        int i
        int N=2000
        float dx, s = 0.0
    cdef struct _inner:
        int inner_a
    cdef struct nested:
        int outer_a
        _inner inner
    #...
    cdef mycpx a = mycpx(3.1415, -1.0)
    cdef mycpx b = mycpx(real=2.718, imag=1.618034)
    cdef mycpx zz = {'real': 3.1415, 'imag': -1.0}
    cdef nested n = {'order_a':1, 'inner': {'inner_a':2}}
    dx = (b - a) / N
    for i in range(N):
        s += f(a + i * dx)
    return s * dx

def displacement(real do, real vo, real a, real t):
    cdef real d = do + (vo * t) + (0.5 * a * t ** 2)
    return d
