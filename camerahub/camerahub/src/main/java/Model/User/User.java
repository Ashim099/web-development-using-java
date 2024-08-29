package Model.User;

public class User {
	private String FirstName,LastName,Contact,Email,Password,ProfilePicture;
	public User(String FirstName,String LastName,String Contact,String Email, String Password, String ProfilePicture) {
		super();
		this.FirstName=FirstName;
		this.LastName=LastName;
		this.Email = Email;
		this.Password = Password;
		this.Contact=Contact;
		this.ProfilePicture=ProfilePicture;
	}
	public User() {
		
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String FirstName) {
		this.FirstName = FirstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String LastName) {
		this.LastName = LastName;
	}

	public String getContact() {
		return Contact;
	}

	public void setContact(String Contact) {
		this.Contact = Contact;
	}


	public String getEmail() {
		return Email;
	}

	public void setEmail(String Email) {
		this.Email = Email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String Password) {
		this.Password = Password;
	}
	public String getProfilePicture() {
		return ProfilePicture;
	}

	public void setProfilePicture(String ProfilePicture) {
		this.ProfilePicture = ProfilePicture;
	}
}
