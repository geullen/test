package com.daeju.controller;

import java.util.Arrays;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.daeju.domain.ResponseDTO;
import com.daeju.domain.User;
import com.daeju.domain.User_Folder;
import com.daeju.domain.User_Folder_Img;
import com.daeju.persistence.UserFolderImgRepository;
import com.daeju.persistence.UserFolderRepository;

import jdk.internal.org.jline.utils.Log;

@RestController
@RequestMapping("/img")
public class ImgController {

	@Autowired
	private UserFolderRepository userFolderRepo;
	
	@Autowired
	private UserFolderImgRepository userFolderImgRepo;
	
	/***
	 * 이미지 생성
	 * 2. 유저는 자신의 특정 폴더에 업로드된 사진을 저장할 수 있다.
	 */
	@Transactional
	@PutMapping("/createImg")
	public ResponseEntity<?> createImg(
		@RequestBody User_Folder_Img userFolderImg
	) {
		Optional<User_Folder> user_folder_check = userFolderRepo.findById(userFolderImg.getFolder_id());
		if(!user_folder_check.isEmpty()) {
			User_Folder_Img img = new User_Folder_Img();
			img.setImg_name(userFolderImg.getImg_name());
			img.setFolder_id(userFolderImg.getFolder_id());
			userFolderImgRepo.save(img);
			return ResponseEntity.ok(img);
		}else {
			ResponseDTO res = new ResponseDTO();
			res.setResultCode(99);
			return ResponseEntity.ok(res);
		}		
	}
	
}
