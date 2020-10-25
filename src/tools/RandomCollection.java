package tools;

import java.util.NavigableMap;
import java.util.Random;
import java.util.TreeMap;

public class RandomCollection<E> {
	private final NavigableMap<Double, E> map = new TreeMap<Double, E>();
	private final Random random;
	private double total = 0;

	public RandomCollection() {
		this(new Random());
	}

	public RandomCollection(Random random) {
		this.random = random;
	}

	public RandomCollection<E> add(double weight, E result) {
		if (weight <= 0)
			return this;
		total += weight;
		map.put(total, result);
		return this;
	}

	public E next() {
		// 隨機取出特定key之後，將total扣除其權重，remove才不會失敗，可取出不重複的元素
		double value = random.nextDouble() * total;
		double key = map.higherKey(value);
		total -= key;
		return map.remove(key);
	}
}