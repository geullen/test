package com.daeju.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@EqualsAndHashCode(of="folderId")
@Table(name="folder")
public class Folder {

	@Id
//	@GeneratedValue(
//	        generator = "sequence_folder",
//	        strategy = GenerationType.SEQUENCE
//	    )
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int folderId;
	
	private String folderName;
	
	@CreationTimestamp
	@Column(name="createdat")
	private Timestamp created_at;
	
	@UpdateTimestamp
	@Column(name="updatedat")
	private Timestamp updated_at;
	
	@ManyToOne(optional=false)//user left outer join folder
//	@ManyToOne(optional=true)//user inner join folder
	private User user;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="folderId")
	private List<Image> image;

}
