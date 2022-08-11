package com.codingdojo.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	@Autowired
	private LanguageRepository langRepo;
	
	// read all the items pulled from repo
	public List<Language> allLanguages()
	{
		return langRepo.findAll();
	}
	
	// create a langauge
	public Language createLanguage(Language l)
	{
		return langRepo.save(l);
	}
	
	// Read one language
	public Language findLanguage(Long id)
	{
		Optional<Language> tempLang = langRepo.findById(id);
		if (tempLang.isPresent())
		{
			return tempLang.get();
		}
		else
		{
			return null;
		}
	}
	
	// Update one language
	public Language updateLanguage(Language l)
	{
		return langRepo.save(l);
	}
	
	// Delete one language
	public void deleteLanguage(Long id)
	{
		langRepo.deleteById(id);
	}
}
