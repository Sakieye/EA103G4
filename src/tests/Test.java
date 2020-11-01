package tests;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import javax.naming.NamingException;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import tools.JedisUtil;
import tools.SimpleRedisLogger;

public class Test {
	private static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");
	private static final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
	private static final String CATEGORY_REX = "([^\\s,]+,[^\\s,]+,[^\\s,]+)|([^\\s,]+,[^\\s,]+)|([^\\s,]+)";

	public static void main(String[] args) throws NamingException, SQLException {
		String[] test = { "a,b,c", "a,b", "a", "a,", "b,,", "c,,,", "a ,", "b, ,", "c, , ," };

		for (String s : test) {
			s = s.replaceAll("\\s+", "");
			System.out.println(s + " - " + s.matches(CATEGORY_REX));
		}
	}
}
