package com.daeju.persistence;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.daeju.domain.NoneUsedPointFolderCount;
import com.daeju.domain.PointHst;


public interface UserPointHstRepository extends CrudRepository<PointHst, Integer>{

	/***
	 * 4.2 통계를 위해 전체 폴더 중에 획득한 포인트에서 소모가 없는 폴더 목록을 추출한다.
	 */
	@Query(value="select b.folder_id as folderId, b.folder_name as folderName from\r\n"
			+ "(\r\n"
			+ "select folder_id,\r\n"
			+ "sum(case when point_dv='01' then get_point*1 else 0 end) as getPoint,\r\n"
			+ "sum(case when point_dv='02' then get_point*-1 else 0 end) as givePoint,\r\n"
			+ "sum(case when point_dv='01' then get_point*1 when point_dv='02' then get_point*-1 else 0 end) as tolPoint\r\n"
			+ "from pointhst\r\n"
			+ "group by folder_id\r\n"
			+ ") a inner join folder b on b.folder_id=a.folder_id\r\n"
			+ "where tolPoint = 1000" , nativeQuery=true)
	Collection<NoneUsedPointFolderCount> countFolderImgCount();
	
}
