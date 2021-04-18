package com.daeju.domain;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//@ToString
//@Entity
//@Table(name="pointhst")
public class PointHst {

	private int pointHstId;
	private String pointDv;
	private int rmdPoint;
	private int getPoint;
	@CreationTimestamp
	private Timestamp created_at;
	
	@UpdateTimestamp
	private Timestamp updated_at;
}
