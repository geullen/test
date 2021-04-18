package com.daeju.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.daeju.domain.NoneUsedPointFolderCount;
import com.daeju.persistence.UserPointHstRepository;

@RestController
@RequestMapping("/pointhst")
public class PointHstController {

	@Autowired
	UserPointHstRepository repo;
	
	@PostMapping("/selectNonUse")
	public ResponseEntity<?> selectNonUse(){
		Collection<NoneUsedPointFolderCount> data = repo.countFolderImgCount();
		return ResponseEntity.ok(data);
	}
}
