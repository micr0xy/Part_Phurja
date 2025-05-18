package com.DAO;
import java.util.List;


import com.entity.ItemDetails;


public interface ItemDAO {
	
	public boolean addItems(ItemDetails i);
	
	
	public List<ItemDetails> getAllItems();
	
	public ItemDetails getItemById(int id);
	
	public boolean updateEditItems(ItemDetails i);
	
	public boolean deleteItems(int id);
	
	public List<ItemDetails> getFeaturedItems();
}
