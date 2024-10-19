import subprocess
import pytest

def pytest_addoption(parser):
    parser.addoption('--behave', action='store_true',help='run behave BBD tests')

def pytest_configure(config):
    if config.getoption('--behave'):
        subprocess.run(['behave'],check=True)