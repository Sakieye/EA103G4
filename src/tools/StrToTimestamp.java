package tools;

import java.sql.Timestamp;

public class StrToTimestamp {
	private StrToTimestamp() {}
	
	public static Timestamp convert(String time) {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		ts = Timestamp.valueOf(time + ":00"); // 原始格式 2020-09-30 00:00需加:00
		return ts;
	}
}
