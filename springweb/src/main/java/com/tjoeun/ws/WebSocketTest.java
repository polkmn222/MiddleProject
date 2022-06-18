package com.tjoeun.ws;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.springframework.stereotype.Component;


@Component
//@ServerEndpoint("/websocket")
@ServerEndpoint(value="/websocket", configurator=HttpSessionConfig.class)

public class WebSocketTest {
	
	 /* 웹소켓 세션 보관용 ArrayList */
    private static ArrayList<Session> sessionList = new ArrayList<Session>();

    /* 웹소켓 사용자 접속시 호출됨  */
    @OnOpen
    public void handleOpen(Session session, EndpointConfig config) {
        
    	HttpSession httpSession = (HttpSession) config.getUserProperties().get("session");
    	String uid = (String)httpSession.getAttribute("uid");
    	System.out.println("웹소켓에 전달된 이용자 ID :" + uid);
    	
    	if (session != null) {
            String sessionId = session.getId();
            
            System.out.println("client is connected. sessionId == [" + sessionId + "]");
            sessionList.add(session);
            
            /* 웹소켓에 접속한 모든 이용자에게 메시지 전송 */
            sendMessageToAll("--> [USER-" + sessionId + "] is connected. ");
        }
    }

    /* 웹소켓 이용자로부터 메시지가 전달된 경우 실행됨 */
    @OnMessage
    public String handleMessage(String message, Session session) {
        if (session != null) {
            String sessionId = session.getId();
            System.out.println("message is arrived. sessionId == [" + sessionId + "] / message == [" + message + "]");

            /* 웹소켓에 접속한 모든 이용자에게 메시지 전송 */
            sendMessageToAll("[USER-" + sessionId + "] " + message);
        }

        return null;
    }

    /* 웹소켓 이용자가 연결을 해제하는 경우 실행됨 */
    @OnClose
    public void handleClose(Session session) {
        if (session != null) {
            String sessionId = session.getId();
            System.out.println("client is disconnected. sessionId == [" + sessionId + "]");
            
            /* 웹소켓에 접속한 모든 이용자에게 메시지 전송 */
            sendMessageToAll("***** [USER-" + sessionId + "] is disconnected. *****");
        }
    }

    /* 웹소켓 에러 발생시 실행됨 */
    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace();
    }
    
    
    /* 웹소켓에 접속한 모든 이용자에게 메시지 전송 */
    private boolean sendMessageToAll(String message) {
        if (sessionList == null) {
            return false;
        }

        int sessionCount = sessionList.size();
        if (sessionCount < 1) {
            return false;
        }

        Session singleSession = null;

        for (int i = 0; i < sessionCount; i++) {
            singleSession = sessionList.get(i);
            if (singleSession == null) {
                continue;
            }

            if (!singleSession.isOpen()) {
                continue;
            }

            sessionList.get(i).getAsyncRemote().sendText(message);
        }

        return true;
    }

	
}
