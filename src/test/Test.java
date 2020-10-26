package test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.naming.NamingException;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.params.sortedset.ZAddParams;
import tools.JedisUtil;
import tools.SimpleRedisLogger;

public class Test {
	private static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");

	public static void main(String[] args) throws NamingException, SQLException {
		SimpleRedisLogger logger = new SimpleRedisLogger();
		// 取得Jedis連線資源
		JedisPool pool = JedisUtil.getJedisPool();
		Jedis jedis = pool.getResource();
		jedis.auth("123456");

		for (int i = 1; i <= 200; i++) {
			jedis.lpush("TEST", i + "time");
		}

		jedis.ltrim("TEST", 0, 99);
		List<String> range1 = jedis.lrange("TEST", 0, -1);
		range1.forEach(s -> System.out.println(s));
		// 歸還連線資源到Jedis連線池
		JedisUtil.closeJedis(jedis);

	}
}
