import sys
from distutils.core import setup, Extension
from Cython.Build import cythonize

if sys.platform == 'darwin':
    from distutils import sysconfig
    vars = sysconfig.get_config_vars()
    vars['LDSHARED'] = vars['LDSHARED'].replace('-bundle', '-dynamiclib')

libimgui = Extension('libimgui',
    sources = [
        'imgui/imgui.cpp',
        'imgui/imgui_draw.cpp',
    ],
    undef_macros=['NDEBUG'],
    language = 'c++',
)

setup(
    name='cyimgui',
    ext_modules = [libimgui] + cythonize('*.pyx', gdb_debug=True)
)
