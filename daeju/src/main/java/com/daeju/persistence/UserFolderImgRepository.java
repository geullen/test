package com.daeju.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.daeju.domain.User_Folder_Img;

public interface UserFolderImgRepository extends CrudRepository<User_Folder_Img, Integer>{

}
