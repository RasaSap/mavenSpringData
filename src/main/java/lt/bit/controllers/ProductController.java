/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.controllers;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import lt.bit.dao.ItemDAO;
import lt.bit.dao.ProductDAO;
import lt.bit.data.Item;
import lt.bit.data.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lenovo
 */

@Controller
public class ProductController {
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private ItemDAO itemDAO;
    
   // @Autowired
   // PasswordEncoder pe;
    
    @GetMapping("/")
    public ModelAndView productList() {
    ModelAndView mav = new ModelAndView("index");
    mav.addObject("list", productDAO.findAll());
              
    return mav;        
    }
    
     @GetMapping("/edit")
    public ModelAndView cart(@RequestParam(name = "id", required = false) String id) {
        ModelAndView mav = new ModelAndView("edit");
        Product product = null;      
        product = productDAO.getOne(id);      
        mav.addObject("product", product);
        return mav;
    }
    
    @PostMapping("/save")
    @Transactional
    //sitie metodai yra tranzakciniai, tie kurie naudoja DML
    public String saveItem(
            @RequestParam(name = "id", required = false) String productId,
            @RequestParam(name = "quantity", required = false) Integer quantity
        
    ) {
       System.out.println(quantity);        
       System.out.println(productId);
       
       Item item = new Item(); 
       item.setProductId(productDAO.getOne(productId));     
       item.setQuantity(quantity);
       
       itemDAO.save(item);
        
       return "redirect:/cart?id=" + item.getId();
    }
    
     @RequestMapping(path = "pass", method = RequestMethod.GET)
    @ResponseBody
    public String pass(@RequestParam(name = "pass", required = false) String pass) {
       
        //return pe.encode(pass);
        return pass;
        
    }
    
}