package es.institutmarianao.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.web.servlet.ModelAndView;

//TODO - Configure Spring element and add mappings

public class AdminController {

	public ModelAndView orders() throws ServletException, IOException {

		// TODO - get all user orders
		// TODO - Prepare the orders.jsp view and send user orders and Order.STATES as
		// parameter
		return null;
	}

	public String setDeliveryDate(/* TODO - Get reference parameter */
	/* TODO - Get deliveryDate parameter */) throws ServletException, IOException {

		/* TODO - Get the order related to the reference passed as parameter */
		/* TODO - Set the order delivery date with the deliveryDate value */
		/* TODO - Save the order */
		return "redirect:/admin/orders";
	}

	public String setState(/* TODO - Get reference parameter */
	/* TODO - Get state parameter */) throws ServletException, IOException {

		/* TODO - Get the order related to the reference passed as parameter */
		/* TODO - Set the order state with the state value */
		/* TODO - Save the order */
		return "redirect:/admin/orders";
	}
}
