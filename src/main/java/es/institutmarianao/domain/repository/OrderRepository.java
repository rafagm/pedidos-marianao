package es.institutmarianao.domain.repository;

import java.util.Set;

import es.institutmarianao.domain.Order;
import es.institutmarianao.domain.User;

public interface OrderRepository {
	Set<Order> getAll();

	Order getByReference(Integer reference);

	Set<Order> findByUser(User client);

	void save(Order order);
}
