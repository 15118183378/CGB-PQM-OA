package com.dy.oa.webSocket;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.dy.oa.pojo.User;

@ServerEndpoint(value = "/chat", configurator = HttpSessionConfigurator.class)
public class ChatAnnotation {

	private static final Set<ChatAnnotation> connections = new CopyOnWriteArraySet<>();

	private Session session;
	private String staffName;

	public ChatAnnotation() {
	}

	@OnOpen
	public void start(Session session, EndpointConfig config) {
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		User user = (User) httpSession.getAttribute("user");
		this.session = session;
		this.staffName = user.getName();
		connections.add(this);
		
		String message = String.format("%s %s", staffName, "进入了聊天室");
		broadcast(message);
	}

	@OnClose
	public void end() {
		connections.remove(this);
		String message = String.format("%s %s", staffName, "离开了聊天室");
		broadcast(message);
	}

	@OnMessage
	public void incoming(String message) {
		// Never trust the client
		// TODO: �������������
		broadcast(message);
	}

	@OnError
	public void onError(Throwable t) throws Throwable {
		System.out.println("Chat Error: " + t.toString());
	}

	private static void broadcast(String msg) {
		for (ChatAnnotation client : connections) {
			try {
				synchronized (client) {
					client.session.getBasicRemote().sendText(msg);
				}
			} catch (IOException e) {
				System.out.println("Chat Error: Failed to send message to client");
				connections.remove(client);
				try {
					client.session.close();
				} catch (IOException e1) {
					// Ignore
				}
				String message = String.format("%s %s", client.staffName, "离开了聊天室");
				broadcast(message);
			}
		}
	}
}
