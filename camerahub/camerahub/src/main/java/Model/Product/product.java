package Model.Product;

public class product {
	private String productName, productCategory, productBrand, productPrice, productImage;
	private int stockLeft;
	public product() {
		
	}
	public product(String productName, String productCategory, String productBrand, String productPrice, String productImage, int stockLeft) {
		this.productName = productName;
		this.productCategory = productCategory;
		this.productBrand = productBrand;
		this.productPrice = productPrice;
		this.productImage = productImage;
		this.stockLeft = stockLeft;
		
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setBrandName(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductPicture(String productImage) {
		this.productImage = productImage;
	}
	public int getStockLeft() {
		return stockLeft;
	}
	public void setStockLeft(int stockLeft) {
		this.stockLeft = stockLeft;
	}
}
