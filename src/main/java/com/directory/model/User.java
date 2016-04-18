package com.directory.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "DIR_USER")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id = 1;

	@Column(name = "SSO_ID", unique = true, nullable = false)
	private String ssoId;

	@NotEmpty

	private String firstName;

	@NotEmpty
	@Column(name = "LAST_NAME", nullable = false)
	private String lastName;

	@NotEmpty
	@Column(name = "EMAIL", nullable = false)
	private String email;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<UserInscription> userInscription = new HashSet<UserInscription>();

	@OneToOne(cascade=CascadeType.ALL)
//	@JsonManagedReference
	private HomeAddress homeAddress;

	public Set<UserInscription> getUserInscription() {
		return userInscription;
	}

	public void setUserInscription(Set<UserInscription> userInscription) {
		this.userInscription = userInscription;
	}

	// @JsonIgnore
	public HomeAddress getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(HomeAddress homeAddress) {
		this.homeAddress = homeAddress;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSsoId() {
		return ssoId;
	}

	public void setSsoId(String ssoId) {
		this.ssoId = ssoId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@JsonIgnore
	public Set<UserInscription> getUserDocuments() {
		return userInscription;
	}

	public void setUserDocuments(Set<UserInscription> UserInscriptions) {
		this.userInscription = UserInscriptions;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", ssoId=" + ssoId + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", email=" + email + "]";
	}

}
