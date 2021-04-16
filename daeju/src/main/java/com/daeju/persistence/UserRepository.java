package com.daeju.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.daeju.domain.User;

public interface UserRepository extends CrudRepository<User, Integer>{
	
}
