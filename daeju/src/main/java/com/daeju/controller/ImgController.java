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

import com.daeju.domain.Folder;
import com.daeju.domain.Image;
import com.daeju.domain.ResponseDTO;
import com.daeju.domain.User;
import com.daeju.persistence.UserFolderImgRepository;
import com.daeju.persistence.UserFolderRepository;

import jdk.internal.org.jline.utils.Log;

@RestController
@RequestMapping("/img")
public class ImgController {

	
}
