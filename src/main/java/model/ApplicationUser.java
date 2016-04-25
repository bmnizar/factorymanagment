package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the application_users database table.
 * 
 */
@Entity
@Table(name="application_users")
@NamedQuery(name="ApplicationUser.findAll", query="SELECT a FROM ApplicationUser a")
public class ApplicationUser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String username;

	private byte enabled;

	private String password;

	//bi-directional one-to-one association to ApplicationUsersRole
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="username", referencedColumnName="username")
	private ApplicationUsersRole applicationUsersRole;

	public ApplicationUser() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ApplicationUsersRole getApplicationUsersRole() {
		return this.applicationUsersRole;
	}

	public void setApplicationUsersRole(ApplicationUsersRole applicationUsersRole) {
		this.applicationUsersRole = applicationUsersRole;
	}

}