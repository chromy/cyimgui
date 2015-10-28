import sys
from distutils.core import setup, Extension
from Cython.Build import cythonize

setup(
    name='cyimgui',
    ext_modules = cythonize('pyimgui/imgui.pyx', gdb_debug=True)
)
