package es.institutmarianao.domain.repository;

import java.util.List;

import es.institutmarianao.domain.Item;

public interface ItemRepository {
	List<Item> getAll();

	Item get(String reference);
}
