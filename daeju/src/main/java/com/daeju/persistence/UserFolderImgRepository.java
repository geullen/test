package com.daeju.persistence;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.daeju.domain.Image;
import com.daeju.domain.ImgTagCount;

public interface UserFolderImgRepository extends CrudRepository<Image, Integer>{

	@Query(value="select i.img_id as imgId, i.img_name as imgName, count(t.tag_id) as tagCount "
			+ "from image i left outer join tag t on i.img_id=t.img_id "
			+ "group by i.img_id "
			+ "order by count(t.tag_id) desc limit 10", nativeQuery = true)
	Collection<ImgTagCount> countImgTagCountTop10();
}
