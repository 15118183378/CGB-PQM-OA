package com.dy.oa.pojo;

public class Announcement {
    private Integer id;

    private String title;

    private String content;

    private String issuer;

    private String createTime;

    private String announcementType;
    
    private Organize organize;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getIssuer() {
        return issuer;
    }

    public void setIssuer(String issuer) {
        this.issuer = issuer == null ? null : issuer.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getAnnouncementType() {
        return announcementType;
    }

    public void setAnnouncementType(String announcementType) {
        this.announcementType = announcementType == null ? null : announcementType.trim();
    }

	public Organize getOrganize() {
		return organize;
	}

	public void setOrganize(Organize organize) {
		this.organize = organize;
	}
}