package com.daeju;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import com.daeju.domain.FolderImgCount;
import com.daeju.persistence.UserFolderRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FolderImgCountApplicationTest {

	@Autowired
	private UserFolderRepository userFolderRepo;
	
	@Test
	public void testFolderImg() {
		Collection<FolderImgCount> data = userFolderRepo.countFolderImgCount(1);
		data.forEach(
			folder -> System.out.println(folder)	
		);
		
	}
}
