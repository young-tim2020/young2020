package com.kh.runningdog.animal.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.animal.model.dao.AnimalDao;
import com.kh.runningdog.animal.model.vo.Animal;

@Service
public class AnimalServiceImpl implements AnimalService {

	@Autowired
	private AnimalDao animalDao;
	
	@Override
	public int insertAnimal(Animal animal) {
		return animalDao.insertAnimal(animal);
	}

	@Override
	public ArrayList<Animal> selectList(Animal animal) {
		return animalDao.selectList(animal);
	}

	@Override
	public Animal selectOne(String desertionNo) {
		return animalDao.selectOne(desertionNo);
	}


	@Override
	public int selectListCount() {
		return animalDao.selectListCount();
	}

	@Override
	public void updateReadCount(String desertionNo) {
		animalDao.updateReadCount(desertionNo);
		
	}
	
}
