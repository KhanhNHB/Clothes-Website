/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author Hello
 */
public class ProductDTO implements Serializable {
    private String id;
    private String name;
    private double unitPrice;
    private String image;
    private String details;
    private String categoryId;
    private String country;
    private int quantity;
    private String size;

    public ProductDTO() {
    }

    public ProductDTO(String id, String name, double unitPrice, String image, String details, String categoryId, String country) {
        this.id = id;
        this.name = name;
        this.unitPrice = unitPrice;
        this.image = image;
        this.details = details;
        this.categoryId = categoryId;
        this.country = country;
    }

    public ProductDTO(String id, String name, double unitPrice, String image, String details, String categoryId, String country, int quantity, String size) {
        this.id = id;
        this.name = name;
        this.unitPrice = unitPrice;
        this.image = image;
        this.details = details;
        this.categoryId = categoryId;
        this.country = country;
        this.quantity = quantity;
        this.size = size;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the unitPrice
     */
    public double getUnitPrice() {
        return unitPrice;
    }

    /**
     * @param unitPrice the unitPrice to set
     */
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the details
     */
    public String getDetails() {
        return details;
    }

    /**
     * @param details the details to set
     */
    public void setDetails(String details) {
        this.details = details;
    }

    /**
     * @return the categoryId
     */
    public String getCategoryId() {
        return categoryId;
    }

    /**
     * @param categoryId the categoryId to set
     */
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the size
     */
    public String getSize() {
        return size;
    }

    /**
     * @param size the size to set
     */
    public void setSize(String size) {
        this.size = size;
    }
 
    public double totalPrice() {
        return this.quantity * this.unitPrice;
    }
    
}
