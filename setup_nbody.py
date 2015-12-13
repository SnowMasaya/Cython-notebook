#!/usr/bin/env python
#-*- coding:utf-8 -*-
from distutils.core import setup
from Cython.Build import cythonize

setup(name="nbody",ext_modules=cythonize('nbody.pyx'))
