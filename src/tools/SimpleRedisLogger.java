package tools;

import java.util.Date;
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

	public LinkedHashMap<String, Date> getInfo(Jedis jedis, String key) {
		Set<Tuple> res = jedis.zrevrangeWithScores(key, 1, -1);
		LinkedHashMap<String, Date> msgs = new LinkedHashMap<String, Date>();
		res.forEach(tuple -> {
			Double score = (Double) tuple.getScore();
			msgs.put(tuple.getElement(), new Date(score.longValue()));
		});
		return msgs;
	}

}
