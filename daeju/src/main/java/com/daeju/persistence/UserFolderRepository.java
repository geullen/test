package com.daeju.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.daeju.domain.User_Folder;

public interface UserFolderRepository extends CrudRepository<User_Folder, Integer>{

}
