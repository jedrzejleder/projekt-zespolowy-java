package beans;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String username;
    private String passwd;

    public User() {
        id = 0;
        username = "";
        passwd = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
}
