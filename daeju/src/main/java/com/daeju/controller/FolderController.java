package com.daeju.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.daeju.domain.ResponseDTO;
import com.daeju.domain.User;
import com.daeju.domain.User_Folder;
import com.daeju.persistence.UserFolderRepository;
import com.daeju.persistence.UserRepository;

@RestController
@RequestMapping("/folder")
public class FolderController {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private UserFolderRepository userFolderRepo;
	
	/***
	 * 1. 유저는 자신만의 폴더를 생성할 수 있다.
	 * - 생성시 폴더에 대한 이름을 정할 수 있다.
	 * - 폴더의 생성 수는 제한이 없다.
	 */
	@Transactional
	@PutMapping("/createFolder")
	public ResponseEntity<?> createFolder(
			@RequestBody User_Folder user_folder
	) {
		Optional<User> user = userRepo.findById(user_folder.getId());
		if(!user.isEmpty()) {
			User_Folder userFolder = new User_Folder();
			userFolder.setFolder_name(user_folder.getFolder_name());
			userFolder.setId(user_folder.getId());
			userFolderRepo.save(userFolder);
			return ResponseEntity.ok(user_folder);
		}else {
			ResponseDTO res = new ResponseDTO();
			res.setResultCode(99);
			return ResponseEntity.ok(res);
		}		
	}
	
	/***
	 * 4. 유저는 특정 폴더에서 최근 저장한 순서대로 사진을 조회할 수 있다
	 * @param user_folder
	 * @return
	 */
	
	@Transactional
	@PostMapping("/selectImg")
	public ResponseEntity<?> selectFolder(
			@RequestBody User_Folder user_folder
	){
		user_folder = userFolderRepo.findById(user_folder.getFolder_id()).orElseThrow(()-> new NullPointerException("데이터가 없습니다."));
		return  ResponseEntity.ok(user_folder);
	}
	
}
