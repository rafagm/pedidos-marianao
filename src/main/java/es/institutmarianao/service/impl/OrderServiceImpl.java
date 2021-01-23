package es.institutmarianao.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.institutmarianao.domain.Order;
import es.institutmarianao.domain.User;
import es.institutmarianao.domain.repository.OrderRepository;
import es.institutmarianao.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository orderRepository;

	@Override
	public Set<Order> findByUser(User client) {
		return orderRepository.findByUser(client);
	}

}
