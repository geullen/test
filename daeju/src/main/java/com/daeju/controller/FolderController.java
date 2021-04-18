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

import com.daeju.domain.Folder;
import com.daeju.domain.FolderImgCount;
import com.daeju.domain.PointHst;
import com.daeju.domain.ResponseDTO;
import com.daeju.domain.User;
import com.daeju.persistence.UserFolderRepository;
import com.daeju.persistence.UserPointHstRepository;
import com.daeju.persistence.UserRepository;

@RestController
@RequestMapping("/folder")
public class FolderController {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private UserFolderRepository userFolderRepo;
	
	@Autowired
	private UserPointHstRepository userPointHstRepo;

	private static final int FOLDER_PLUS_POINT = 1000;
	private static final int IMG_MINUS_POINT = 100;
	
	/***
	 * 1.1. 유저는 자신만의 폴더를 생성할 수 있다.
	 * - 생성시 폴더에 대한 이름을 정할 수 있다.
	 * - 폴더의 생성 수는 제한이 없다. (완료)
	 * 
	 * 3.2 포인트 서비스 : 폴더 생성시마다 해당 유저는 1,000 포인트를 획득한다.
	 * 
	 * 4.1 유저가 폴더를 2개 (생성순서대로 폴더 1, 폴더 2 생성시) 2,000 포인트 획득 => 이력 남기기
	 */
	@Transactional
	@PutMapping("/createFolder")
	public ResponseEntity<?> createFolder(
			@RequestBody Folder folder
	) {
		Optional<User> user = userRepo.findById(folder.getUser().getId());
		if(!user.isEmpty()) {
			Folder folderAf = new Folder();
			folderAf.setFolderName(folder.getFolderName());
			folderAf.setUser(folder.getUser());
			userFolderRepo.save(folderAf);

			//폴더생성시 USER에 1,000포인트 획특 및 POINT에 이력 남기기
			//유저정보 세팅
			User userAf = new User();
			userAf.setId(folder.getUser().getId());
			userAf.setName(user.get().getName());
			//폴더생성시 1000포인트 추가
			userAf.setRmdPoint(user.get().getRmdPoint()+FOLDER_PLUS_POINT);
			userAf.setCreated_at(user.get().getCreated_at());
			PointHst pointHst = new PointHst();
			pointHst.setUser(userAf);
			pointHst.setFolderId(folderAf.getFolderId());
			pointHst.setPointDv("01");//01 : 폴더
			pointHst.setRmdPoint(user.get().getRmdPoint()+FOLDER_PLUS_POINT);
			pointHst.setGetPoint(FOLDER_PLUS_POINT);
			
			userPointHstRepo.save(pointHst);
			userRepo.save(userAf);
			
			return ResponseEntity.ok(folderAf);
		}else {
			ResponseDTO res = new ResponseDTO();
			res.setResultCode(99);
			return ResponseEntity.ok(res);
		}		
	}

	/***
	 * 이미지 생성
	 * 1.2. 유저는 자신의 특정 폴더에 업로드된 사진을 저장할 수 있다.
	 * - 사진은 어딘가의 이미지 서버에 저장이 되고 이에 대한 URL이 저장된다고 가정한다.(실제 이미지 업로드 기능은 필요 없음)
	 * - N개의 사진을 동시에 저장할 수 있다. (완료)
	 * 
	 * 3.3 포인트서비스 : 사진 업로드시 해당 유저는 사진 1개당 100포인트 소모한다.
	 * 3.4 포인트서비스 : 포인트가 모자란 경우 사진을 업로드할 수 없다.
	 * 
	 * 4.1 사진업로드시 100포인트 차감에 대한 이력 남기기
	 */
	@Transactional
	@PutMapping("/createImg")
	public ResponseEntity<?> createImg(
		@RequestBody Folder folder
	) {
		
		//유저포인트 존재여부 확인
		//존재하면 사진 업로드 가능
		//폴더 존재여부 파악 후
		Optional<Folder> folderCheck = userFolderRepo.findById(folder.getFolderId());
		int imgCount = folder.getImage().size();
		
		if(folderCheck.isPresent() && (folderCheck.get().getUser().getRmdPoint()-imgCount*IMG_MINUS_POINT) >= 0) {
			folder.setFolderName(folderCheck.get().getFolderName());
			folder.setCreated_at(folderCheck.get().getCreated_at());
			userFolderRepo.save(folder);
			
			//사진업로시 USER에 이미지 개수당 100포인트 차감 및 POINT에 이력 남기기 
			//이미지 저장 개수만큼 for문
			for(int i=0; i<imgCount; i++) {
				PointHst pointHst = new PointHst();
				pointHst.setUser(folder.getUser());
				pointHst.setFolderId(folder.getFolderId());
				pointHst.setPointDv("02");//02 : 이미지
				pointHst.setRmdPoint(folderCheck.get().getUser().getRmdPoint()-IMG_MINUS_POINT*(i+1));
				pointHst.setGetPoint(IMG_MINUS_POINT);
				
				userPointHstRepo.save(pointHst);
			}
			
			//최종잔여금 계산
			User userAf = new User();
			userAf.setId(folderCheck.get().getUser().getId());
			userAf.setName(folderCheck.get().getUser().getName());
			//사진추가시 100포인트 차감
			userAf.setRmdPoint(folderCheck.get().getUser().getRmdPoint()-IMG_MINUS_POINT*imgCount);
			userAf.setCreated_at(folderCheck.get().getUser().getCreated_at());
			
			userRepo.save(userAf);
			
			return ResponseEntity.ok(folder);
		}else {
			ResponseDTO res = new ResponseDTO();
			res.setResultCode(99);
			return ResponseEntity.ok(res);
		}
	}
	
	/***
	 * 생성된 폴더 조회
	 * 폴더별 이미지 조회
	 * 1.3. 유저는 자신의 폴더를 생성 순서대로 조회할 수 있으며, 이 때에 각 폴더에 저장된 이미지 갯수를 알 수 있다. (확인중)
	 */
	@Transactional
	@PostMapping("/selectFolder")
	public ResponseEntity<?> selectFolder(
		@RequestBody Folder folder
	){
		Collection<FolderImgCount> data = userFolderRepo.countFolderImgCount(folder.getUser().getId());
		return ResponseEntity.ok(data);
	}
	
	/***
	 * 1.4. 유저는 특정 폴더에서 최근 저장한 순서대로 사진을 조회할 수 있다
	 * @param user_folder
	 * @return
	 */
	@Transactional
	@PostMapping("/selectImg")
	public ResponseEntity<?> selectImg(
			@RequestBody Folder folder
	){
		folder = userFolderRepo.findById(folder.getFolderId()).orElseThrow(()-> new NullPointerException("데이터가 없습니다."));
		return  ResponseEntity.ok(folder);
	}
	
}
