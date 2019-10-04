/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.dao;

import java.util.List;
import lt.bit.data.Item;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Lenovo
 */
public interface ItemDAO extends JpaRepository<Item, Integer>{
    @Modifying
    @Query("update Item i set i.orderId = :orderId where i.id = :id")
    public void update(@Param("orderId") Integer orderId,@Param("id") Integer id);
  
    //@Query("select i from Item i where i.orderId = :orderId")
    //public List<Item> findByOrderId(@Param (value = "orderId") Integer orderId);
}
