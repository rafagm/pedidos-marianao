package es.institutmarianao.service;

import java.util.Set;

import es.institutmarianao.domain.Order;
import es.institutmarianao.domain.User;


public interface OrderService {
	Set<Order> findByUser(User client);
}
