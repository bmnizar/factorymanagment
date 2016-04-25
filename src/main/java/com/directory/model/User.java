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

@Entity
@Table(name = "Dir_USER")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id = 1;
	@NotEmpty
	private String firstName;

	@NotEmpty
	@Column(name = "LAST_NAME", nullable = false)
	private String lastName;

	@NotEmpty
	@Column(name = "EMAIL", nullable = false)
	private String email;

	private String phoneNumber;

	@NotEmpty
	@Column(name = "ROLE", nullable = false)
	private String role;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<UserInscription> userInscription = new HashSet<UserInscription>();

	private String homeAddress;

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	@JsonIgnore
	public Set<UserInscription> getUserInscription() {
		return userInscription;
	}

	public void setUserInscription(Set<UserInscription> userInscription) {
		this.userInscription = userInscription;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
		return "User [id=" + id + ",firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ",phoneNumber=" + phoneNumber + ",adress=" + homeAddress + ",role=" + role + "]";
	}

}
