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

	public static void main(String[] args) throws NamingException, SQLException {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		long current = System.currentTimeMillis();// 當前時間毫秒數
		long zero = c.getTimeInMillis();// 今天零點零分零秒的毫秒數
		long twelve = zero + 24 * 60 * 60 * 1000 - 1;// 今天23點59分59秒的毫秒數

		// 程式啟動起算到第一輪執行之間的延遲時間
		long initDelay = twelve - current;
		
		System.out.println(new Date(zero));

		// 測試用啟動初始更新(執行一次)
//		ScheduledExecutorService startUpService = Executors.newSingleThreadScheduledExecutor();
//		Date cur = new Date(System.currentTimeMillis());
//		System.out.println("促銷事件測試用初始啟動更新: " + formatter.format(cur));
//		startUpService.schedule(new StatisticsTimerTask(bookService), 0,
//				TimeUnit.MILLISECONDS);

		// 啟動起算下一輪時間開始每天23:59:59執行一次
		Date nextRun = new Date(initDelay + System.currentTimeMillis());
		System.out.println("瀏覽/銷售統計更新器下一輪執行時間: " + formatter.format(nextRun));
	}
}
