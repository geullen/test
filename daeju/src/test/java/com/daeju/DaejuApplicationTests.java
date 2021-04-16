package com.daeju;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.daeju.domain.User;
import com.daeju.domain.User_Folder;
import com.daeju.domain.User_Folder_Img;
import com.daeju.persistence.UserFolderImgRepository;
import com.daeju.persistence.UserFolderRepository;
import com.daeju.persistence.UserRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
class DaejuApplicationTests {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private UserFolderRepository userFolderRepo;
	
	@Autowired
	private UserFolderImgRepository userFolderImgRepo;
	
	@Test
	public void contextLoads() {
		
		Class<?> clz = userRepo.getClass();
		
		System.out.println(clz.getName());
		Class<?>[] interfaces = clz.getInterfaces();
		
		Stream.of(interfaces).forEach(inter -> System.out.println(inter.getName()));
		
		Class<?> superClasses = clz.getSuperclass();
		
		System.out.println(superClasses.getName());
		
	}
	
	@Test
	public void testInsertUser() {
		for(int i=1; i<=50; i++) {
			User user = new User();
			user.setName("이대주"+i);
			userRepo.save(user);
		}
		
	}
	
	@Test
	public void testInsertFolder() {
		for(int i=1; i<=5; i++) {
			User_Folder userFolder = new User_Folder();
			userFolder.setId(1);
			userFolder.setFolder_id(i);
			userFolder.setFolder_name("폴더"+i);
			userFolderRepo.save(userFolder);
		}
		
		for(int i=1; i<=34; i++) {
			User_Folder_Img userFolderImg = new User_Folder_Img();
			if(i%5==0) {
				userFolderImg.setFolder_id(5);
			}else {
				userFolderImg.setFolder_id(i%5);
			}
			userFolderImg.setImg_id(i);
			userFolderImg.setImg_name("사진"+i);
			userFolderImgRepo.save(userFolderImg);
		
		}
	}
}
