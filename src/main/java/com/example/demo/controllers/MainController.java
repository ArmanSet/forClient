package com.example.demo.controllers;


import com.example.demo.entity.Products;
import com.example.demo.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collection;
import java.util.List;

@Controller()
public class MainController {
   private ProductsService productsService;
  @Autowired
   public MainController(ProductsService productsService) {
      this.productsService = productsService;
   }

   @GetMapping("/")
    public String home(Model model) {
      List<Products> products =  productsService.findAll();
//        model.addAttribute("title", "Home");
        model.addAttribute("products", products);

       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       boolean isAuthenticated = false;
       if (authentication != null) {
           Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
           for (GrantedAuthority authority : authorities) {
               if (authority.getAuthority().equals("ROLE_USER")) {
                   isAuthenticated = true;
                   break;
               } else if (authority.getAuthority().equals("ROLE_ADMIN")) {
                   isAuthenticated = true;
                   break;
               } else {
                   isAuthenticated = false;
               }
           }
       }

       Collection<? extends GrantedAuthority> authoritiesForProductPageDeleteItems = authentication.getAuthorities();
       for (GrantedAuthority authority : authoritiesForProductPageDeleteItems) {
           if (authority.getAuthority().equals("ROLE_ADMIN")) {
               model.addAttribute("isAdmin", true);
               break;
           } else {
               model.addAttribute("isAdmin", false);
           }
       }

       System.out.println(isAuthenticated);
       model.addAttribute("isAuthenticated", isAuthenticated);
        return "index";
    }

}