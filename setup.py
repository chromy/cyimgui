from distutils.core import setup
from Cython.Build import cythonize

setup(
    name='imgui',
    ext_modules = cythonize('*.pyx')
)
