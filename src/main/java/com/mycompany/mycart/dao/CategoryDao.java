/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

   
public class CategoryDao {
   
    private SessionFactory factory;
    
    public CategoryDao(SessionFactory factory){
        this.factory=factory;
    }
    
    public int saveCategory(Category cat){
        
        int catId;
        try (Session session = this.factory.openSession()) {
            Transaction tx = session.beginTransaction();
            catId = (int) session.save(cat);
            tx.commit();
        }
        return catId;
    }
    
    public List<Category> getCategory(){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
    
    public Category getCategoryById(int cid){
        Category cat=null;
        
        try (Session session = this.factory.openSession()) {
            cat = session.get(Category.class, cid);
        }
       
       return cat;
    }
    
}
