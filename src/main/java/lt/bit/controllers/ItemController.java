/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.controllers;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import lt.bit.dao.ItemDAO;
import lt.bit.dao.OrderDAO;
import lt.bit.dao.ProductDAO;
import lt.bit.data.Item;
import lt.bit.data.OrderDet;
import lt.bit.data.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lenovo
 */
@Controller
public class ItemController {
    
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private ItemDAO itemDAO;
    
    @Autowired
    private OrderDAO orderDAO;
   
    @GetMapping("/cart")
    public ModelAndView itemList() {
        ModelAndView mav = new ModelAndView("cart");   
        mav.addObject("itemList", itemDAO.findAll());
        mav.addObject("total", total());
        return mav;
    }
       
    @GetMapping("/cart/delete")
    @Transactional
    public String deleteItem(
            @RequestParam(name = "id2", required = true) Integer id2,
            @RequestParam(name = "id", required = true) String id) {
        itemDAO.deleteById(id2);
       
        return "redirect:/cart";
    } 
    
    public double total(){
        
        List<Item> itemList= itemDAO.findAll();
        double sum = 0;
        double itemSum = 0;
        
        for(int i = 0; i < itemList.size(); i++){
            itemSum = itemList.get(i).getProductId().getPrice() * itemList.get(i).getQuantity();
            sum += itemSum;
        }
        
        return sum;
        
    }
    
    @GetMapping("/editCart")
    public ModelAndView edit() {
        ModelAndView mav = new ModelAndView("editCart");
        OrderDet o = null;
        
        mav.addObject("order", o);
        return mav;
    }
    
    @PostMapping("/saveOrder")
    @Transactional
    //sitie metodai yra tranzakciniai, tie kurie naudoja DML
    public String saveOrder(
            @RequestParam(name = "name", required = true) String name,
            @RequestParam(name = "surname", required = true) String surname,
            @RequestParam(name = "address", required = true) String address,
            @RequestParam(name = "email", required = true) String email,
            @RequestParam(name = "phone", required = true) String phone 
        
    ) {
       System.out.println(name);        
       System.out.println(surname);
       
       
       OrderDet order = new OrderDet();
       order.setName(name);     
       order.setSurname(surname);
       order.setStreet(address);
       order.setEmailas(email);
       order.setPhoneN(phone);
       
       orderDAO.save(order);      
      
       List <Item> items = itemDAO.findAll();
       for(int i = 0; i < items.size(); i++){
          int orderId = order.getId();
          items.get(i).setOrderId(orderDAO.getOne(orderId));
       
       // ideti i items lentele    order.getId();
       }
       
       System.out.println(order.getId());
       return "redirect:/orderDetails?id=" + order.getId();
    }
    
    
}
    

