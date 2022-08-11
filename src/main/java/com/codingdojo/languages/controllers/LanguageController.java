package com.codingdojo.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;

@Controller
public class LanguageController {
	@Autowired
	private LanguageService langServ;
	
	// redirect
	@GetMapping("/")
	public String redirectMe()
	{
		return "redirect:/languages";
	}
	
	// All Languages
	@GetMapping("/languages")
	public String allLanguages(Model model)
	{
		// Show all languages
		List<Language> allLanguages = langServ.allLanguages();
		model.addAttribute("allLanguages", allLanguages);
		
		// Add language to list
		Language language = new Language();
		model.addAttribute("language",language);
		
		return "index.jsp";
	}
	
	// Post - Create Language
	@PostMapping("/languages")
	public String createLanguage(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model)
	{
		if(result.hasErrors())
		{
			// Show all languages UI component
			List<Language> allLanguages = langServ.allLanguages();
			model.addAttribute("allLanguages", allLanguages);
			return "index.jsp";
		}
		else
		{
			langServ.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	// Edit - Rendering Edit Page
	@GetMapping("/languages/edit/{id}")
	public String editPage(@PathVariable("id") Long id, Model model)
	{
		// Find the language by id
		Language thisLanguage = langServ.findLanguage(id);
		
		// pass thisLanguage to render on jsp page
		model.addAttribute("thisLanguage", thisLanguage);
		return "edit.jsp";
	}
	
	// Edit - Making the edit to the entry
	@PutMapping("/languages/edit/{id}")
	public String update(@Valid @ModelAttribute("thisLanguage") Language language, BindingResult result)
	{
		if(result.hasErrors())
		{
			return "edit.jsp";
		}
		else
		{
			langServ.updateLanguage(language);
			return "redirect:/languages";
		}
	}
	
	// Delete 
	@DeleteMapping("/languages/{id}")
	public String delete(@PathVariable("id") Long id)
	{
		langServ.deleteLanguage(id);
		return "redirect:/";
	}
	
	// Show single language
	@GetMapping("/languages/{id}")
	public String singleLanguage(@PathVariable("id") Long id, Model model)
	{
		Language thisLanguage = langServ.findLanguage(id);
		model.addAttribute("thisLanguage", thisLanguage);
		return "show.jsp";
	}
	
}
