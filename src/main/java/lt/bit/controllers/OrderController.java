/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.controllers;

import java.util.List;
import lt.bit.dao.ItemDAO;
import lt.bit.dao.OrderDAO;
import lt.bit.dao.ProductDAO;
import lt.bit.data.Item;
import lt.bit.data.OrderDet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lenovo
 */
@Controller
public class OrderController {
    
    @Autowired
    private ItemDAO itemDAO;
    
    @Autowired
    private OrderDAO orderDAO;
    
   @GetMapping(path = "/orderDetails")
    public ModelAndView orderDetails(        
        @RequestParam(name = "id", required = true) Integer id) {
        ModelAndView mav = new ModelAndView("orderDetails");
        OrderDet order = orderDAO.getOne(id);
    
       List<Item> itemList=orderDAO.getOne(id).getItemList();
        double itemAmount=0;
        double totalAmount=0;
        for(int i = 0; i < itemList.size(); i++){      
          itemAmount = itemList.get(i).getProductId().getPrice() * itemList.get(i).getQuantity();
          totalAmount += itemAmount;
        }
        
        mav.addObject("order", order);
        mav.addObject("totalAmount", totalAmount);
        mav.addObject("itemList", itemList);
        return mav;
    }  
    
    
   
}
