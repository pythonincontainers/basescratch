# -*- coding: utf-8 -*-
"""
    'factors_flask.py' Module Description
    This module defines code to run a number factoring webserver
    Module defines functions corresponding to following paths:

        '/<int:numer>'   - factor function calls find_factors from 'factors.py' Module
                           and returns a string containing a list of computed factors
                           return Status Code of HTTP_200_OK
        '/'              - hello_world function returns usage string with Status Code of HTTP_200_OK
        '/<path:path>'   - unsupported function returns info about unsupported paths
                           and usage info with Status Code of HTTP_400_BAD_REQUEST
"""

from timeit import default_timer
from flask import Flask
from flask_api import status
from factors import find_factors

APP = Flask(__name__)

@APP.route('/')
def hello_world() -> str:
    """
        Args:
            no arguments expected

        Returns:
            str: Greetings and Usage Hint text and Status Code HTTP_200_OK

        Note:
            hello_world is called when root path of the Applications is accessed
    """
    return 'Hello from Factoring Server. Please try localhost:5000/number with positive integer'

@APP.route('/<path:path>')
def unsupported(path: str) -> str:
    """
        Args:
            path (path): any path, other than root and /<int:number>

        Returns:
            str: Greeting, info about the path beeing unsupported and usage hint
                 plus Status Code of HTTP_400_BAD_REQUEST

        Note:
            unsupported is a catch all function for any path other than root or positive integer
    """
    return 'Hello from Factoring Server. Factoring of "' \
            + path \
            + '" is not supported. Please try localhost:5000/number with positive integer', \
            status.HTTP_400_BAD_REQUEST

@APP.route('/<int:number>')
def factor(number: int) -> str:
    """
        Args:
            number (int): non-negative integer

        Returns:
            str: String containing a list of factors calculated for argument,
                 or an info that any positive integer is a factor of zero.
                 Time of computation is also returned. Status Code is HTTP_200_OK.

        Note:
            This path is used only in case of non-negative integers.
            Function returns time in seconds taken to compute factors.
    """
    if number == 0:
        return "Any positive integer is a factor of 0."
    start = default_timer()
    result = find_factors(number)
    end = default_timer()
    return "Factors of " \
           + str(number) \
           + " are " \
           + str(result).strip('[]') \
           + ". Computed in " \
           + str(end-start) \
           + " seconds."

if __name__ == '__main__':
    APP.run(debug=False, host='0.0.0.0')
