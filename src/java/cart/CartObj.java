/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import dto.ProductDTO;
import java.util.HashMap;

/**
 *
 * @author Hello
 */
public class CartObj extends HashMap<String, ProductDTO> {

    public void addProductToCart(ProductDTO productDTO) {
        if (this.containsKey(productDTO.getName())) {
            productDTO.setQuantity(this.get(productDTO.getName()).getQuantity() + productDTO.getQuantity());
        } 
        this.put(productDTO.getName(), productDTO);
    }
    
    public void removeProductToCart(ProductDTO productDTO) {
        if (this.containsKey(productDTO.getName())) {
            this.remove(productDTO.getName());
        }
    }

}
