from abc import abstractmethod
import abc
from typing import Optional

class Attributes():
    
    @abstractmethod
    def is_in_range(self) -> bool:
        pass
    
    @abstractmethod
    def is_fluctuating(self) -> bool:
        pass
    
    @abstractmethod 
    def user_prioritisation(self) -> bool:
        pass
    


class Root:
    
    # Initialiser.
    def __init__(self) -> None:
        self.value: float = 0.0
        self.left: Optional[Root]
        self.right: Optional[Root]
        
    # Methods.
    @abstractmethod
    def evaluate(self, value: Attributes) -> bool:
        pass
    
    def output(self, value: Attributes) -> bool:
        node: Optional[Root] = self
        while node is not None:
            
            result = self.evaluate(value)
            if result is True:
                node = self.left
            else:
                node = self.right
                
            if node is None:
                return result
            
        
        
        
    

class FluctuationNode(Root):
    
    def evaluate(self, value: Attributes) -> bool:
        return value.is_fluctuating()
    
class PrioritisationNode(Root):
    
    def evaluate(self, value: Attributes) -> bool:
        return value.user_prioritisation()
    
class RangeNode(Root):
    
    def evaluate(self, value: Attributes) -> bool:
        return value.is_in_range()
    
class Cadence(Attributes):
    @abstractmethod
    def is_in_range(self) -> bool:
        return False
    
    @abstractmethod
    def is_fluctuating(self) -> bool:
        return True
    
    @abstractmethod 
    def user_prioritisation(self) -> bool:
        return False
    
root: RangeNode = RangeNode()
node: FluctuationNode = FluctuationNode()
root.right = FluctuationNode()
print(root.output(Cadence()))
    