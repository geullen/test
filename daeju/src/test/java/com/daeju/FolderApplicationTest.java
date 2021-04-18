package com.daeju;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.daeju.domain.Folder;
import com.daeju.domain.User;
import com.daeju.persistence.UserFolderRepository;
import com.daeju.persistence.UserRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FolderApplicationTest {

	@Autowired
	private UserFolderRepository userFolderRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Test
	public void test() {
		List<User> userList = userRepo.findByName("이대주1");
		userList.forEach(
				user -> System.out.println(user.toString())
			);
		
		List<Folder> folder = userFolderRepo.findByfolderName("저장1");
		System.out.println(folder.toString());
	}
}
