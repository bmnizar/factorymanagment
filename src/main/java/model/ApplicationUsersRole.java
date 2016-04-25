package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the application_users_roles database table.
 * 
 */
@Entity
@Table(name="application_users_roles")
@NamedQuery(name="ApplicationUsersRole.findAll", query="SELECT a FROM ApplicationUsersRole a")
public class ApplicationUsersRole implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_role_id")
	private int userRoleId;

	private String role;

	//bi-directional one-to-one association to ApplicationUser
	@OneToOne(mappedBy="applicationUsersRole", fetch=FetchType.LAZY)
	private ApplicationUser applicationUser;

	public ApplicationUsersRole() {
	}

	public int getUserRoleId() {
		return this.userRoleId;
	}

	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public ApplicationUser getApplicationUser() {
		return this.applicationUser;
	}

	public void setApplicationUser(ApplicationUser applicationUser) {
		this.applicationUser = applicationUser;
	}

}