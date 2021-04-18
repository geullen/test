package com.daeju.controller;

import java.util.Collection;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.daeju.domain.Image;
import com.daeju.domain.ImgTagCount;
import com.daeju.domain.ResponseDTO;
import com.daeju.persistence.UserFolderImgRepository;

@RestController
@RequestMapping("/image")
public class ImgController {
	
	@Autowired
	UserFolderImgRepository imgRepo;
	
	/***
	 * 1. 사진 저장시 N개의 문자 태그를 추가로 전달받아 저장해야 한다.
	 */
	@Transactional
	@PutMapping("/createTag")
	public ResponseEntity<?> createTag(
			@RequestBody Image image
	){
		Optional<Image> imageCheck = imgRepo.findById(image.getImgId());
		if(imageCheck.isPresent()) {
			image.setImgName(imageCheck.get().getImgName());
			image.setCreated_at(imageCheck.get().getCreated_at());
			imgRepo.save(image);
			
			return ResponseEntity.ok(image);
		}else {
			ResponseDTO res = new ResponseDTO();
			res.setResultCode(99);
			return ResponseEntity.ok(res);
		}
	}
	
	/***
	 * 2. 통계를 위해 전체 사진에서 가장 많이 달린 태그에 대한 TOP 10을 추출할 수 있어야 한다.
	 */
	@Transactional
	@PostMapping("/selectTag")
	public ResponseEntity<?> selectTag(){
		Collection<ImgTagCount> data = imgRepo.countImgTagCountTop10();
		return ResponseEntity.ok(data);
	}
}
