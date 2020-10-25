package com.timer;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Timer;
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
import com.promo.model.PromoService;
import com.promodetail.model.PromoDetailService;

@WebServlet(name = "PromoTimer", urlPatterns = "/PromoTimer", loadOnStartup = 1)
public class PromoTimer extends HttpServlet {

	private static final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		PromoService promoService = (PromoService) getServletContext().getAttribute("promoService");
		PromoDetailService promoDetailService = (PromoDetailService) getServletContext()
				.getAttribute("promoDetailService");
		BookService bookService = (BookService) getServletContext().getAttribute("bookService");
		// 啟動當個小時的0分0秒
		Calendar c = Calendar.getInstance();
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);

		// 程式啟動起算到第一輪執行之間的延遲時間
		long initDelay = (c.getTimeInMillis() % 1800000 + 1800000) - (System.currentTimeMillis() % 1800000);
		
		// 測試用啟動初始更新(執行一次)
//		ScheduledExecutorService startUpService = Executors.newSingleThreadScheduledExecutor();
//		Date cur = new Date(System.currentTimeMillis());
//		System.out.println("促銷事件測試用初始啟動更新: " + formatter.format(cur));
//		startUpService.schedule(new PromoTimerTask(promoService, promoDetailService, bookService), 0,
//				TimeUnit.MILLISECONDS);

		// 啟動起算下一輪時間開始每30分一次
		ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
		Date nextRun = new Date(initDelay + System.currentTimeMillis());
		System.out.println("促銷事件更新器啟動時間: " + formatter.format(nextRun));
		service.scheduleAtFixedRate(new PromoTimerTask(promoService, promoDetailService, bookService), initDelay,
				1000 * 60 * 30, TimeUnit.MILLISECONDS);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
