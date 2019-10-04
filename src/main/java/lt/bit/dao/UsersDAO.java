/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.dao;

import java.util.List;
import lt.bit.data.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Lenovo
 */
public interface UsersDAO extends JpaRepository<Users, Integer>{
    @Query("select u from Users u where u.name = :name")
    public List<Users> findByName(@Param (value = "name") String name);
    
}
