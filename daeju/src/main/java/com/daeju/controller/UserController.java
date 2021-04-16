package com.daeju.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.daeju.domain.User;
import com.daeju.persistence.UserRepository;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository userRepo;
	
	/***
	 * 생성된 폴더 조회
	 * 폴더별 이미지 조회
	 * 3. 유저는 자신의 폴더를 생성 순서대로 조회할 수 있으며, 이 때에 각 폴더에 저장된 이미지 갯수를 알 수 있다.
	 */
	
	@Transactional
	@PostMapping("/selectFolder")
	@ResponseBody
	public ResponseEntity<?> selectFolder(
			@RequestBody User user
	){
		user = userRepo.findById(user.getId()).orElseThrow(()-> new NullPointerException("데이터가 없습니다."));
		return  ResponseEntity.ok(user);
	}
	
}
