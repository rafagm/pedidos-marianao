package es.institutmarianao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.institutmarianao.domain.Item;
import es.institutmarianao.domain.repository.ItemRepository;
import es.institutmarianao.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemRepository itemRepository;
	
	@Override
	public List<Item> getAll() {
		return itemRepository.getAll();
	}

	@Override
	public Item get(String reference) {
		return itemRepository.get(reference);
	}
	

}
