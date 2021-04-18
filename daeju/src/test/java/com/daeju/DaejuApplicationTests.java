package com.daeju;

import java.util.stream.Stream;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.daeju.domain.User;
import com.daeju.persistence.UserRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
class DaejuApplicationTests {

	/***
	 * 테이블 생성 및 초기데이터 세팅
	 */
	@Autowired
	private UserRepository userRepo;
	
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
			user.setName("사용자"+i);
			userRepo.save(user);
		}
		
	}
}
