package com.tjoeun.ws;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

/** ServerEndPoint 클래스(웹소켓 서버)에서 접근할 수 있는 설정자 클래스 */
public class HttpSessionConfig extends Configurator {
   @Override
   public void modifyHandshake( // System에서 제공
         /* 아래의 config 에 저장한 내용은 ServerEndPoint 클래스에 전달된다 */
         ServerEndpointConfig config, 
         HandshakeRequest request, 
         HandshakeResponse response) {
      HttpSession session = (HttpSession) request.getHttpSession();
      ServletContext context = session.getServletContext();
      
      /* 위에서 구한 HttpSession 객체의 참조를 config에 저장한다 */
      config.getUserProperties().put("session", session); // key value -> get가능
      // 아래처럼 다수개의 값도 저장 가능
      config.getUserProperties().put("context", context);
   }
}