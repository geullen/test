package com.daeju.domain;

/***
 * 
 * @author LEE
 * 3.유저는 자신의 폴더를 생성 순서대로 조회할 수 있으며, 이 때에 각 폴더에 저장된 이미지 갯수를 알 수 있다
 *
 */
public interface FolderImgCount {
	Integer getFolderId();
	String getFolderName();
	Integer getImgCount();
}
