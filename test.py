import abc
from abc import abstractmethod

class Metrics:
    def __init__(self) -> None:
        self.range: float = 1.0

class Node:
    
    # Methods:
    @abstractmethod
    def evaluate(self, metrics: Metrics) -> bool:
        pass
    
    @abstractmethod
    def test(self, metrics: Metrics) -> bool:
        pass
    

class FalseNode(Node):
    def evaluate(self, metrics: Metrics) -> bool:
        return self.test(metrics)
    
    def test(self, metrics: Metrics) -> bool:
        return False
    

class TrueNode(Node):
    def evaluate(self, metrics: Metrics) -> bool:
        return self.test(metrics)
    
    def test(self, metrics: Metrics) -> bool:
        return True
    

class QueryNode(Node):
    
    def __init__(self, value: float = 0.0) -> None:
        self.value: float = value
        self.positive_node: Node
        self.negative_node: Node
    
    def evaluate(self, metrics: Metrics) -> bool:
        if self.test(metrics) is True:
            return self.positive_node.evaluate(metrics)
        
        return self.negative_node.evaluate(metrics)
    
    @abstractmethod
    def test(self, metrics: Metrics) -> bool:
        pass
    

class RangeQuery(QueryNode):
    
    def __init__(self, value: float = 0.0) -> None:
        super().__init__(value)
        
    def test(self, metrics: Metrics) -> bool:
        
        if self.value < metrics.range:
            self.value = metrics.range
            return self.positive_node.evaluate(metrics)
        
        return self.negative_node(metrics)
        

query: RangeQuery = RangeQuery()
metrics: Metrics = Metrics()
metrics.range = 0.4

query.positive_node = TrueNode()
query.negative_node = FalseNode()

print(query.evaluate(metrics))

print("Hello, World")
