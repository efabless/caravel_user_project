from os import path
import sys

sys.path.append(path.abspath('/home/rady/caravel/caravel_user_project/caravel-dynamic-sims/cocotb'))

from interfaces.common_functions.test_functions import report_test
from interfaces.common_functions.test_functions import test_configure
from interfaces.UART import UART
from interfaces.caravel import Caravel_env

import cocotb