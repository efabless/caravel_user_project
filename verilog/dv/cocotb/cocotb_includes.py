from os import path
import sys
sys.path.append(path.abspath('/home/rady/caravel/swift/caravel-dynamic-sims/cocotb'))
from tests.common_functions.test_functions import repot_test
from tests.common_functions.test_functions import test_configure
from interfaces.UART import UART

import cocotb