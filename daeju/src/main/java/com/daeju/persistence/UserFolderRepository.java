package com.daeju.persistence;


import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.CrudRepository;

import com.daeju.domain.Folder;
import com.daeju.domain.FolderImgCount;

@EnableJpaRepositories
public interface UserFolderRepository extends CrudRepository<Folder, Integer>{
	
	public List<Folder> findByfolderName(String folderName);
	
	@Query(value="select f.folder_id as folderId, f.folder_name as folderName, count(i.img_id) as imgCount "
			+ "from folder f left outer join image i on f.folder_id=i.folder_id where f.user_id = ?1 "
			+ "group by f.folder_id order by f.createdat", nativeQuery=true)
	Collection<FolderImgCount> countFolderImgCount(int id);
}
