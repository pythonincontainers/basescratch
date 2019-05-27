# -*- coding: utf-8 -*-
""" docstring Module Description

    'factors.py' Module defines a 'find_factors()' function,
    which takes a non-negative integer as argument and
    returns a list of positive integers being factors of the argument.

    'factors' Module is used by 'find_factors.py'

"""

from typing import List
cimport cython

@cython.boundscheck(False)
@cython.wraparound(False)
@cython.nonecheck(False)
@cython.cdivision(True)

def find_factors(int param):
    """
    Args:
        param (int): non-negative integer

    Returns:
        List[int]: a list of factors of param

    Note:
        param is assumed to be positive,
        if param is zero or negative, function returns [1]
        'factors_flask.py' module performs argument checking
        and calls find_factors only with positive integer arguments
    """
    result = [1]
    cdef int i
    if param > 1:
        for i in range(2, param+1):
            if param % i == 0:
                result += [i]
    return result
