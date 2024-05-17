from enum import Enum
from typing import List, Optional


class MetricType(Enum):
    RANGE = 0
    FLUCTUATION = 1


class Metrics:
    LENGTH: int = 3

    def __init__(self) -> None:
        self.metrics: List[float] = [0.0] * Metrics.LENGTH

    def get(self, metric_type: MetricType) -> float:
        return self.metrics[metric_type.value]

    def set(self, metric_type: MetricType, value: float) -> None:
        self.metrics[metric_type.value] = value


class TreeNode:
    def __init__(self, node_type: Optional[MetricType], node_value: float) -> None:
        self.node_type = node_type
        self.node_value = node_value


class Tree:
    def __init__(self) -> None:
        self.nodes: List[Optional[TreeNode]] = list()

    def evaluate(self, metrics: Metrics) -> bool:
        current_node_index: int = 0

        while current_node_index < len(self.nodes):
            current_node = self.nodes[current_node_index]

            # If the node is null always default to False.
            if current_node is None:
                return False

            # If metric is smaller than node metric value, the metric has a lower prioritisation.
            if metrics.get(current_node.node_type) <= current_node.node_value:
                return False
                
            # The metric has passed, proceed to the next positive node.
            current_node_index = (current_node_index * 2) + 1

        # Each node evaluation was successful, return true.
        return True


# Usage
tree = Tree()
tree.nodes.append(TreeNode(MetricType.FLUCTUATION, 0.6))
tree.nodes.append(TreeNode(MetricType.RANGE, 0.0))

metrics = Metrics()
metrics.set(MetricType.FLUCTUATION, 0.4)
metrics.set(MetricType.RANGE, 0.4)

result = tree.evaluate(metrics)
print(result)

    
    
