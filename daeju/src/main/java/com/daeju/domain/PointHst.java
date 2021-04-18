package com.daeju.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@EqualsAndHashCode(of="pointHstId")
@Table(name="pointhst")
public class PointHst {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="pointHstId")
	private int pointHstId; //이력시퀀스
	private int folderId;
	private String pointDv; //거래구분 ( 01:폴더, 02:사진 )
	private int rmdPoint; // 해당유저가 거래 후 남은 잔여 포인트
	private int getPoint; //포인트 획득 혹은 소모
	
	@CreationTimestamp
	private Timestamp created_at;
	
	@UpdateTimestamp
	private Timestamp updated_at;
	
	@ManyToOne(optional=true)
	private User user;
}
