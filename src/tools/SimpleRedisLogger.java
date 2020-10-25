package tools;

import java.util.LinkedHashMap;
import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

public class SimpleRedisLogger {

	public void setInfo(Jedis jedis, String key, String msg, Double time) {
		jedis.zadd(key, time, msg);
		// 只留最近的20則訊息
		jedis.zremrangeByRank(key, 1, -21);
	}

	public LinkedHashMap<String, Double> getInfo(Jedis jedis, String key) {
		Set<Tuple> res = jedis.zrangeWithScores(key, 1, -1);
		LinkedHashMap<String, Double> msgs = new LinkedHashMap<String, Double>();
		res.forEach(tuple -> {
			msgs.put(tuple.getElement(), tuple.getScore());
		});
		return msgs;
	}

}
