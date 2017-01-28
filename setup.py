from setuptools import setup, Extension

cutils = Extension('research.cutils', sources=['research/cutils.c'])

setup(name='ReSearch',
      version='1.0',
      description='Research tools for Text Search and Information Retrieval',
      download_url='https://github.com/west-tandon/ReSearch',
      license='MIT',
      packages=['research', 'research.coding', 'research.index', 'research.utils'],
      ext_modules=[cutils],
      install_requires=[
          'argparse',
          'importlib'
      ])
