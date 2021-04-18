package com.daeju.persistence;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.daeju.domain.Image;

public interface UserFolderImgRepository extends CrudRepository<Image, Integer>{

//	void save(List<Image> image);

}
