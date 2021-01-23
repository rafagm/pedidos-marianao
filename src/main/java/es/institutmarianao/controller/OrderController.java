package es.institutmarianao.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import es.institutmarianao.domain.Order;
import es.institutmarianao.domain.User;

//TODO - Configure Spring element and add mappings

@SessionAttributes("order")
public class OrderController {
	private UserDetailsService userDetailsService;

	@ModelAttribute("order")
	public Order setupOrder() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		User client = (User) userDetailsService.loadUserByUsername(username);

		Order order = new Order();
		order.setClient(client);
		return order;
	}

	public ModelAndView orders() throws ServletException, IOException {
		// TODO - get authenticated user here
		// TODO - get user orders
		// TODO - Prepare the orders.jsp view and send user orders and Order.STATES as
		// parameter
		return null;
	}

	public ModelAndView newOrder() throws ServletException, IOException {
		// TODO - Prepare the newOrder.jsp view and send all the available items
		// TODO - The new user order is in session
		return null;
	}

	public String newOrderClearItems(@SessionAttribute("order") Order order) throws ServletException, IOException {

		order.clearItems();

		return "redirect:/users/orders/newOrder";
	}

	public String newOrderIncreaseItem(@SessionAttribute("order") Order order
	/* TODO - Get the reference parameter */) throws ServletException, IOException {

		// TODO - Get the item related to the reference passed as parameter
		// TODO - Increase item quantity
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

	public String finishOrder(/* TODO - Get the order submitted in form and validate it */ BindingResult bindingResult,
			SessionStatus sessionStatus) {

		if (bindingResult.hasErrors()) {
			return "finishOrder";
		}
		// TODO - Set a new reference for the order using Order.incReferenceSequence()
		// TODO - Set order start date to current date
		// TODO - Save order
		sessionStatus.setComplete(); // Clean session attributes - leave a new order ready in session

		return "redirect:/users/orders/";
	}
}
