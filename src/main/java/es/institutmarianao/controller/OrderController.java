package es.institutmarianao.controller;

import java.util.List;
import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import es.institutmarianao.domain.Item;
import es.institutmarianao.domain.Order;
import es.institutmarianao.domain.User;
import es.institutmarianao.service.ItemService;
import es.institutmarianao.service.OrderService;

@Controller
@RequestMapping("/users/orders")
@SessionAttributes("order")
public class OrderController {
	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ItemService itemService;

	@ModelAttribute("order")
	public Order setupOrder() {
		User client = getCurrentUser();

		Order order = new Order();
		order.setClient(client);
		return order;
	}

	@GetMapping
	public ModelAndView orders() throws ServletException, IOException {
		User client = getCurrentUser();
		Set<Order> orders = orderService.findByUser(client);

		ModelAndView modelAndView = new ModelAndView("orders");

		modelAndView.addObject("orders", orders);

		return modelAndView;
	}

	@GetMapping("/newOrder")
	public ModelAndView newOrder() throws ServletException, IOException {
		List<Item> items = itemService.getAll();

		ModelAndView modelAndView = new ModelAndView("newOrder");
		// TODO - Prepare the newOrder.jsp view and send all the available items
		modelAndView.addObject("items", items);
		// TODO - The new user order is in session

		return modelAndView;
	}

	public String newOrderClearItems(@SessionAttribute("order") Order order) throws ServletException, IOException {

		order.clearItems();

		return "redirect:/users/orders/newOrder";
	}

	@GetMapping("newOrder/increaseItem")
	public String newOrderIncreaseItem(@SessionAttribute("order") Order order,
			@RequestParam("reference") String reference) throws ServletException, IOException {
		Item item = itemService.get(reference);
		order.increaseQuantity(item);
		
		return "redirect:/users/orders/newOrder";
	}
	
	public String newOrderDecreaseItem(@SessionAttribute("order") Order order
	/* TODO - Get the reference parameter */) throws ServletException, IOException {

		// TODO - Get the item related to the reference passed as parameter
		// TODO - Decrease item quantity

		return "redirect:/users/orders/newOrder";
	}

	public String finishOrder() throws ServletException, IOException {
		// Nothing to do. We have order attibute in session, so the view can take it
		// from there
		return "finishOrder";
	}

	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
	}

	public String finishOrder(/* TODO - Get the order submitted in form and validate it */ BindingResult bindingResult, SessionStatus sessionStatus) {

		if (bindingResult.hasErrors()) {
			return "finishOrder";
		}
		// TODO - Set a new reference for the order using Order.incReferenceSequence()
		// TODO - Set order start date to current date
		// TODO - Save order
		sessionStatus.setComplete(); // Clean session attributes - leave a new order ready in session

		return "redirect:/users/orders/";
	}

	private User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		User client = (User) userDetailsService.loadUserByUsername(username);
		return client;
	}
}
