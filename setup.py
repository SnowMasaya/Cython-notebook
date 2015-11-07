#!/usr/bin/env python
#-*- coding:utf-8 -*-
from distutils.core import setup
from Cython.Build import cythonize

#setup(ext_modules=cythonize('fib.pyx'))
setup(ext_modules=cythonize('integral_max.pyx'))
