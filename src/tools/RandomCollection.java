package tools;

import java.util.AbstractMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Random;
import java.util.TreeMap;

public class RandomCollection {
	// Double(total): <String bookID : Double weight>
	private final NavigableMap<Double, Map.Entry<String, Double>> map = new TreeMap<Double, Map.Entry<String, Double>>();
	private final Random random;
	private double total = 0;

	public RandomCollection() {
		this(new Random());
	}

	public RandomCollection(Random random) {
		this.random = random;
	}

	public RandomCollection add(double weight, String bookID) {
		if (weight <= 0)
			return this;
		total += weight;
		Map.Entry<String, Double> entry = new AbstractMap.SimpleEntry<String, Double>(bookID, weight);
		map.put(total, entry);
		return this;
	}

	public String next() {
		// 隨機取出特定key之後，將total扣除其weight，remove才不會失敗，可取出不重複的元素
		double value = random.nextDouble() * total;
		double key = map.higherKey(value);
		double weight = map.get(key).getValue();
		total -= weight;
		return map.remove(key).getKey();
	}
}