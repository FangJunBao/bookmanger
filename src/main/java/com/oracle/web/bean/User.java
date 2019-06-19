package com.oracle.web.bean;

public class User {
    private Integer id;

    private String name;

    private String touxiang;

    private String username;

    private String password;

    private String phone;

    private String date;

    public User(Integer id, String name, String touxiang, String username, String password, String phone, String date) {
		super();
		this.id = id;
		this.name = name;
		this.touxiang = touxiang;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.date = date;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? null : touxiang.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", touxiang=" + touxiang + ", username=" + username + ", password="
				+ password + ", phone=" + phone + ", date=" + date + "]";
	}
    
}