
class Metrics
{
	public float range = 1.0f;
}

abstract class QueryResult
{
	abstract Boolean test(Metrics metric);
}

class QueryFalse extends QueryResult
{
	@Override
	Boolean test(Metrics metric) { return false; }
}

class QueryTrue extends QueryResult
{
	@Override
	Boolean test(Metrics metric) { return true; }
}

abstract class Node extends QueryResult
{
	// Instance Attributes.
	float value = 0.0f;
	Node left = null;
	Node right = null;

	// Methods:
	abstract Boolean test(Metrics metric);
}

class RangeNode extends Node
{

	@Override
	Boolean test(Metrics metric) 
	{
		return metric.range > value;
	}

}

public class Program 
{

	public static void main(String[] args)
    {
		RangeNode node = new RangeNode();
		Boolean x = node.test(new Metrics());

		System.out.println(x);
	
	}
}