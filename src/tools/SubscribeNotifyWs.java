package tools;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.Follow.model.*;
import com.google.gson.Gson;



@ServerEndpoint("/SubscribeNotifyWs/{memId}")
public class SubscribeNotifyWs {
	private static final Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
	Gson gson = new Gson();
	
	@OnOpen
	public void onOpen(@PathParam("memId") String memId, Session userSession) throws IOException {
		sessionsMap.put(memId, userSession);
	}
	
	@OnMessage
	public void onMessage(Session userSession, String message) {
		AddFaNotify addFaNotify = gson.fromJson(message, AddFaNotify.class);
		String amemId = addFaNotify.getMemId();
		FollowService folSvc = new FollowService();
		List<FollowVO> list = folSvc.getFollowList(amemId);
//		if(list.size() == 0) {
//			return;
//		}
		for(FollowVO followVO : list) {
			Session receiverSession = sessionsMap.get(followVO.getMemId());
			if(receiverSession != null && receiverSession.isOpen()) {
				receiverSession.getAsyncRemote().sendText(message);
			}
		}
		System.out.println("Message received: " + message);
	}
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
	}
	
	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}
}
