/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Hello
 */
public class CreateNewProductErrDAO {
    
    private String productNameLengthError;
    private String productCountryLengthError;
    private String productPriceLengthError;

    public CreateNewProductErrDAO() {
    }

    public CreateNewProductErrDAO(String productNameLengthError, String productCountryLengthError, String productPriceLengthError) {
        this.productNameLengthError = productNameLengthError;
        this.productCountryLengthError = productCountryLengthError;
        this.productPriceLengthError = productPriceLengthError;
    }

    /**
     * @return the productNameLengthError
     */
    public String getProductNameLengthError() {
        return productNameLengthError;
    }

    /**
     * @param productNameLengthError the productNameLengthError to set
     */
    public void setProductNameLengthError(String productNameLengthError) {
        this.productNameLengthError = productNameLengthError;
    }

    /**
     * @return the productCountryLengthError
     */
    public String getProductCountryLengthError() {
        return productCountryLengthError;
    }

    /**
     * @param productCountryLengthError the productCountryLengthError to set
     */
    public void setProductCountryLengthError(String productCountryLengthError) {
        this.productCountryLengthError = productCountryLengthError;
    }

    /**
     * @return the productPriceLengthError
     */
    public String getProductPriceLengthError() {
        return productPriceLengthError;
    }

    /**
     * @param productPriceLengthError the productPriceLengthError to set
     */
    public void setProductPriceLengthError(String productPriceLengthError) {
        this.productPriceLengthError = productPriceLengthError;
    }
    
    
}
