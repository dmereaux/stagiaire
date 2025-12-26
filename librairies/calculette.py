
from robot.api.deco import keyword,library
from robot.api import SkipExecution
from robot.api import Failure
from robot.api import ContinuableFailure

class calculette:
    def addition(self,a:float,b:float):
        return a+b
    def soustraction(self,a:float,b:float):
        return a-b
    def multiplication(self,a:float,b:float):
        return a*b
    def division(self, a:int, b:int):
        if b == 0:
            raise  Failure ("on ne peut pas diviser par 0")
        else:
            return a/b
