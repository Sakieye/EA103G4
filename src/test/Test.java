package test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import tools.JedisUtil;
import tools.SimpleRedisLogger;

public class Test {
	private static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");

	public static void main(String[] args) throws NamingException, SQLException {
		SimpleRedisLogger logger = new SimpleRedisLogger();
		JedisPool pool = JedisUtil.getJedisPool();
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		List<Map.Entry<String, Date>> msgs = logger.getInfo(jedis, "TimerLog");
		// 歸還連線資源到Jedis連線池
		JedisUtil.closeJedis(jedis);
	}
}
