package com.food.model;

import java.sql.Timestamp;

public class Menu {

	private int menuId;
	private int restaurantId;
	private String itemName;
	private String description;
	private double price;
	private boolean isAvailable;
	private String category;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private double rating;
	private String imagePath;
	private boolean isVeg;

	public Menu() {

	}

	public Menu(int menuId, int restaurantId, String itemName, String description, double price,
			boolean isAvailable, String category, Timestamp createdAt, Timestamp updatedAt,
			Timestamp deletedAt) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.category = category;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
	}

	public Menu(int restaurantId, String itemName, String description, double price,
			boolean isAvailable, String category) {
		super();
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.category = category;
	}
	public Menu(int restaurantId, String itemName, String description, double price,
			boolean isAvailable, String category, double rating,
			String imagePath, boolean isVeg) {
		super();
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.category = category;
		this.rating = rating;
		this.imagePath = imagePath;
		this.isVeg = isVeg;
	}

	public Menu(int restaurantId, String itemName, String description, double price,
			boolean isAvailable, String category, Timestamp createdAt,
			Timestamp updatedAt, Timestamp deletedAt) {
		super();
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.category = category;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
		
	}
	public Menu(int menuId, int restaurantId, String itemName, String description, double price,
			boolean isAvailable, String category, double rating, String imagePath,
			boolean isVeg, Timestamp createdAt, Timestamp updatedAt, Timestamp deletedAt) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.category = category;
		this.rating = rating;
		this.imagePath = imagePath;
		this.isVeg = isVeg;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Timestamp getDeletedAt() {
		return deletedAt;
	}

	public void setDeletedAt(Timestamp deletedAt) {
		this.deletedAt = deletedAt;
	}
	public double getRating() {
	    return rating;
	}

	public void setRating(double rating) {
	    this.rating = rating;
	}

	public String getImagePath() {
	    return imagePath;
	}

	public void setImagePath(String imagePath) {
	    this.imagePath = imagePath;
	}

	public boolean isVeg() {
	    return isVeg;
	}

	public void setVeg(boolean isVeg) {
	    this.isVeg = isVeg;
	}

	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", restaurantId=" + restaurantId + ", itemName=" + itemName
				+ ", description=" + description + ", price=" + price + ", isAvailable=" + isAvailable
				+ ", category=" + category + ", rating=" + rating + ", imagePath=" + imagePath
				+ ", isVeg=" + isVeg + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt
				+ ", deletedAt=" + deletedAt + "]";
	}

	public static void main(String[] args) {

	}

}