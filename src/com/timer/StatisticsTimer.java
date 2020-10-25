package com.timer;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.model.BookService;

@WebServlet(name = "StatisticsTimer", urlPatterns = "/StatisticsTimer", loadOnStartup = 1)
public class StatisticsTimer extends HttpServlet {

	private static final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		BookService bookService = (BookService) getServletContext().getAttribute("bookService");
		Calendar c = Calendar.getInstance(); 
		c.set(Calendar.HOUR, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0); 
		c.set(Calendar.MILLISECOND, 0); 
		long current = System.currentTimeMillis();// 當前時間毫秒數
		long zero = c.getTimeInMillis();// 今天零點零分零秒的毫秒數
		long twelve = zero + 24 * 60 * 60 * 1000 - 1;// 今天23點59分59秒的毫秒數

		// 程式啟動起算到第一輪執行之間的延遲時間
		long initDelay = twelve - current;
		
		// 測試用啟動初始更新(執行一次)
//		ScheduledExecutorService startUpService = Executors.newSingleThreadScheduledExecutor();
//		Date cur = new Date(System.currentTimeMillis());
//		System.out.println("促銷事件測試用初始啟動更新: " + formatter.format(cur));
//		startUpService.schedule(new StatisticsTimerTask(bookService), 0,
//				TimeUnit.MILLISECONDS);

		// 啟動起算下一輪時間開始每天23:59:59執行一次
		ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
		Date nextRun = new Date(initDelay + System.currentTimeMillis());
		System.out.println("瀏覽/銷售統計更新器下一輪執行時間: " + formatter.format(nextRun));
		service.scheduleAtFixedRate(new StatisticsTimerTask(bookService), initDelay, 1000 * 60 * 60 * 24, TimeUnit.MILLISECONDS);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
