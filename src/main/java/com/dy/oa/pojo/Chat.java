package com.dy.oa.pojo;

public class Chat {
	
	private Integer id;
	
	private String createTime;
	
	private String content;
	
	private Organize organize;
	
	private User user;
	
	private String isMine;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Organize getOrganize() {
		return organize;
	}

	public void setOrganize(Organize organize) {
		this.organize = organize;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIsMine() {
		return isMine;
	}

	public void setIsMine(String isMine) {
		this.isMine = isMine;
	}
	
}
