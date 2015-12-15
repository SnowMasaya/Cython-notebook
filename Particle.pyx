# cython: nonecheck=True

class Particle:
    cdef public double mass
    cdef readonly double position
    cdef double velocity

    def __init__(self, m, p, v):
        self.mass     = m
        self.position = p
        self.velocity = v

    def get_momentum(self):
        return self.mass * self.velocity

    cdef double get_momentum_c(self):
        return self.mass * self.velocity

    def add_momentums_typed(list particles):
        cdef:
            double total_mom = 0.0
            Particle particle
        for particle in particles:
            total_mom += particle.get_momentum_c()
        return total_mom

cdef class Matrix:
    cdef:
        unsigned int nrows, ncols
        double *_matrix
    cdef __client__(self, nr, nc):
        self.nrows = nr
        self.ncols = nc
        self._matrix = <double*>malloc(nr * nc * sizeof(double))
        if self._matrix == NULL:
            raise MemoryError()
    cdef __dealloc__(self):
        if self._matrix != NULL:
            free(self._matrix)

cdefr class CParticle(Particle):
    cdef double momentum
    def __init__(self, m, p, v):
        super(CParticle, self).__init__(m, p, v)
        self.momentum = self.mass * self.velocity
    cdef double get_momentum(self):
        return self.momentum

class PyParticle(Particle):
    def __init__(self, m, p, v):
        super(PyParticle, self).__init__(m, p, v)
    def get_momentum(self):
        return super(PyParticle, self).get_momentum()

cdef Particle static_p = p
print(static_p.get_momentum())
print(static_p.velocity)

print((<Particle>).get_momentum())
print((<Particle>).velocity)

print((<Particle?>p).get_momentum())
print((<Particle?>p).velocity)

def dispatch(Particle p not None):
    print(p.get_momentum())
    print(p.velocity)

cdef class Particle:

    cdef double mass, position, velocity

    property momentum:
        def __get__(self):
            return self.mass * self.velocity
        def __set__(self, m):
            self.velocity = m / self.mass
