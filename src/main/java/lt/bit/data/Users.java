/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.data;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author Lenovo
 */
@Entity
@Table(name = "users")
public class Users implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
    private Integer id;
    private String name;
    private String pass;
    
    @ManyToMany(mappedBy = "users")
    private List<Groups> groups;


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
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public List<Groups> getGroups() {
        return groups;
    }

    public void setGroupsList(List<Groups> groups) {
        this.groups = groups;
    }

   @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + '}';
    }
    
   @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        //List<GrantedAuthority> list = new ArrayList<>();                   
        //List<Groups> roles = getGroups();
        //if (roles != null) {
        //    for (Groups role : roles) {
         //       list.add(new SimpleGrantedAuthority(role.getName()));
        //    }
       // }
       // return list;
        
         return new HashSet<GrantedAuthority>();
    }

    @Override
    public String getPassword() {
        return getPass();
    }

    @Override
    public String getUsername() {
       return getName();
    }

    @Override
    public boolean isAccountNonExpired() {
       return true;
    }

    @Override
    public boolean isAccountNonLocked() {
       return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
      return true;
    }

    @Override
    public boolean isEnabled() {
       return true;
    }   
}
