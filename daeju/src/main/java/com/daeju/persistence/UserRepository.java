package com.daeju.persistence;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.daeju.domain.User;

public interface UserRepository extends CrudRepository<User, Integer>{

	List<User> findByName(String name);
}
