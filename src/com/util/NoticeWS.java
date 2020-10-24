package com.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import javax.websocket.*;
import javax.websocket.server.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.util.ChatMassage;

import redis.clients.jedis.Jedis;

@ServerEndpoint("/NoticeWS/{mem_id}/{bc_id}"
)
public class NoticeWS {
	private static final Map<String, Set<Session>> allSessions = new ConcurrentHashMap<String, Set<Session>>();
	private static final Map<String, Session> member = new ConcurrentHashMap<String, Session>();

	@OnOpen
	public void onOpen(@PathParam("mem_id") String mem_id, @PathParam("bc_id") String bcRoom, Session userSession) {
		if (!allSessions.containsKey(bcRoom)) {
			allSessions.put(bcRoom, new HashSet<Session>());
		}
		
		System.out.println(mem_id + "已連線" + bcRoom + "群");
		
		Set<Session> roomSessions = allSessions.get(bcRoom);
		roomSessions.add(userSession);// 加入揪團聊天
		member.put(mem_id, userSession);// 加入成員
	}

	@OnMessage
	public void onMessage(@PathParam("mem_id") String mem_id, @PathParam("bc_id") String bcRoom, Session userSession,
			String message) throws JSONException {

		JSONObject obj = new JSONObject(message);
		Set<Session> roomSessions = allSessions.get(obj.get("bc_id"));
		if ("all".equals(obj.get("type"))) {
			for (Session session : roomSessions) {
				if (session.isOpen()) {
					session.getAsyncRemote().sendText(message);
				}
			}
		}
		System.out.println(message);

		// 個人審核通過
		if ("private".equals(obj.get("type"))) {
			Session receivedSession = member.get(obj.get("received"));

			if (receivedSession.isOpen())
				receivedSession.getAsyncRemote().sendText(message);
		}
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		e.printStackTrace();
	}

	@OnClose
	public void onClose(@PathParam("mem_id") String mem_id, @PathParam("bc_id") String bcRoom, Session userSession,
			CloseReason reason) throws JSONException {
		Set<Session> roomSessions = allSessions.get(bcRoom);
		roomSessions.remove(userSession);
		member.remove(mem_id);
		System.out.println(mem_id + "已離開" + bcRoom + "群");
	}
}
