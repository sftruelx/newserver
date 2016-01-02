package com.app1.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name = "classify")
@Indexed
@XmlRootElement
public class Classify extends BaseObject implements Serializable{

	private long id;
	private long parent_id;
	private int level;
	private String title;
	private String img_url;
	private String img_path;
	private String end;
	private Date create_tm;
	private MultipartFile[] files;
	
	 public Classify() {
	    }


	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @DocumentId
	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}


    @Column(name = "parent_id",nullable = true)
    @Field
	public long getParent_id() {
		return parent_id;
	}



	public void setParent_id(long parent_id) {
		this.parent_id = parent_id;
	}


    @Column(name = "level")
    @Field
	public int getLevel() {
		return level;
	}



	public void setLevel(int level) {
		this.level = level;
	}


    @Column(name = "title")
    @Field
	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



    @Column(name = "img_url")
    @Field
	public String getImg_url() {
		return img_url;
	}



	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}


    @Column(name = "img_path")
    @Field
	public String getImg_path() {
		return img_path;
	}



	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}


    @Column(name = "create_tm")
    @Field
	public Date getCreate_tm() {
		return create_tm;
	}



	public void setCreate_tm(Date create_tm) {
		this.create_tm = create_tm;
	}


    @Column(name = "end")
    @Field
	public String getEnd() {
		return end;
	}


	public void setEnd(String end) {
		this.end = end;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return id + this.title + this.level + "....";
	}



	@Override
	public boolean equals(Object o) {
		// TODO Auto-generated method stub
		return false;
	}



	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	 @Transient
	 @JsonIgnore
	public MultipartFile[] getFiles() {
		return files;
	}


	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
}
