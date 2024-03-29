package com.daeju.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
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
@EqualsAndHashCode(of="imgId")
@Table(name="image")
public class Image {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int imgId;
	
	private String imgName;
	
	@CreationTimestamp
	private Timestamp created_at;
	
	@UpdateTimestamp
	private Timestamp updated_at;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="imgId")
	private List<Tag> tag;
}
