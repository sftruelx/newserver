package com.app1.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name = "album")
@Indexed
@XmlRootElement
public class Album extends BaseObject implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long id;
	private String albumName;
	private String author;
	private Long classifyId;
	private String descripe;
	private Date publishDate;
	private Date createTime;
	private String imgPath;
	private MultipartFile[] files;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @DocumentId
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
    @Column(name = "album_name")
    @Field
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	@Column(name = "classify_id",nullable = true)
    @Field
    public Long getClassifyId() {
		return classifyId;
	}
	
	public void setClassifyId(Long classifyId) {
		this.classifyId = classifyId;
	}
	@Column(name = "author",nullable = true)
    @Field
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
    @Column(name = "descripe",nullable = true)
    @Field
	public String getDescripe() {
		return descripe;
	}
	public void setDescripe(String descripe) {
		this.descripe = descripe;
	}
	
    @Column(name = "publish_date",nullable = true)
    @Field
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	
    @Column(name = "create_time",nullable = true)
    @Field
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
    @Column(name = "img_path",nullable = true)
    @Field
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	 @Transient
	 @JsonIgnore
	public MultipartFile[] getFiles() {
		return files;
	}


	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return null;
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
	
	

}
