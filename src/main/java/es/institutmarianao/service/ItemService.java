package es.institutmarianao.service;

import java.util.List;

import es.institutmarianao.domain.Item;

public interface ItemService {
	List<Item> getAll();

	Item get(String reference);
}
