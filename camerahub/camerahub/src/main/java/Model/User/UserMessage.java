package Model.User;

public class UserMessage {
	private String content;
	private String type;
	private String cssClass;
	public UserMessage(String content, String type, String cssClass) {
		this.content = content;
		this.type = type;
		this.cssClass = cssClass;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
}
