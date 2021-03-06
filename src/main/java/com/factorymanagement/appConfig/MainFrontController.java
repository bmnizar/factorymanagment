package com.factorymanagement.appConfig;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainFrontController {
	
	@RequestMapping(value = { "/SchedularModalContent" }, method = RequestMethod.GET)
	public ModelAndView schedularModalContent() {
		System.out.println();
		ModelAndView model = new ModelAndView();     
		model.setViewName("SchedularModalContent");
		return model;
	}
	@RequestMapping(value = { "/Planification" }, method = RequestMethod.GET)
	public ModelAndView schedularCalendar() {
		System.out.println();
		ModelAndView model = new ModelAndView();     
		model.setViewName("Planification");
		return model;
	}
	@RequestMapping(value = { "/CalculerDureeFabrication" }, method = RequestMethod.GET)
	public ModelAndView calculateConstructionDuration() {
		System.out.println();
		ModelAndView model = new ModelAndView();
		model.setViewName("CalculerDureeFabrication");
		return model;
	}
	@RequestMapping(value = { "/Product" }, method = RequestMethod.GET)
	public ModelAndView product() {
		System.out.println();
		ModelAndView model = new ModelAndView();
		model.setViewName("Product");
		return model;
	}
	@RequestMapping(value = { "/PagePrincipaleResponsableProduction" }, method = RequestMethod.GET)
	public ModelAndView productResponsible() {
		System.out.println();
		ModelAndView model = new ModelAndView();
		model.setViewName("PagePrincipaleResponsableProduction");
		return model;
	}
	@RequestMapping(value = { "/FicheProduitFabrication" }, method = RequestMethod.GET)
	public ModelAndView productConstructionList() {
		System.out.println();
		ModelAndView model = new ModelAndView();
		model.setViewName("FicheProduitFabrication");
		return model;
	}
	@RequestMapping(value = { "/addProduct" }, method = RequestMethod.GET)
	public ModelAndView addProduct() {
		System.out.println();
		ModelAndView model = new ModelAndView();
		model.setViewName("addProduct");
		return model;
	}
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
		Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
		GrantedAuthority grantedAuthority = iterator.next();
		String authority = grantedAuthority.getAuthority();
		ApplicationRole applicationRole = ApplicationRole.valueOf(authority);
		ModelAndView model = new ModelAndView();
		if (applicationRole.equals(ApplicationRole.ROLE_ANONYMOUS)) {
			model.setViewName("loginPage");
			return model;
		}
		if (applicationRole.equals(ApplicationRole.AdminRole)) {
			model.setViewName("homePage");
			return model;
		}
		if (applicationRole.equals(ApplicationRole.CommandeServiceRole)) {
			model.setViewName("commandeService");
			return model;
		}
		
		if (applicationRole.equals(ApplicationRole.ProductionServiceRole)) {
			model.setViewName("productionService");
			return model;
		}

		model.setViewName("homePage");
		return model;
	}

	@RequestMapping(value = { "/homePage" }, method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("homePage");
		return model;
	}
	@RequestMapping(value = { "/commandeService" }, method = RequestMethod.GET)
	public ModelAndView commandeService() {
		ModelAndView model = new ModelAndView();
		model.setViewName("commandeService");
		return model;
	}
	@RequestMapping(value = { "/createUserContent" }, method = RequestMethod.GET)
	public ModelAndView createUserContent() {
		ModelAndView model = new ModelAndView();
		model.setViewName("createUserContent");
		return model;
	}

	@RequestMapping(value = { "/editUserContent" }, method = RequestMethod.GET)
	public ModelAndView editUserContent() {
		ModelAndView model = new ModelAndView();
		model.setViewName("editUserContent");
		return model;
	}

	@RequestMapping(value = { "/deleteUserContent" }, method = RequestMethod.GET)
	public ModelAndView deleteUserContent() {
		ModelAndView model = new ModelAndView();
		model.setViewName("deleteUserContent");
		return model;
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Error....!");
		}

		if (logout != null) {
			model.addObject("message", "Logged successfully.");
		}

		model.setViewName("loginPage");
		return model;
	}

}