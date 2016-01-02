package com.app1.model;

import java.io.Serializable;

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
@Table(name = "artist")
@Indexed
@XmlRootElement
public class Artist extends BaseObject implements Serializable{
	
	private long artistId;
	private String artistName;
	private String artistPath;
	private String artistImg;
	private long albumId;
	private MultipartFile[] files;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "artist_id")
    @DocumentId
	public long getArtistId() {
		return artistId;
	}
	public void setArtistId(long artistId) {
		this.artistId = artistId;
	}
	
	
	@Column(name = "album_id")
    @Field
    public long getAlbumId() {
		return albumId;
	}
	public void setAlbumId(long albumId) {
		this.albumId = albumId;
	}
	
	@Column(name = "artist_name")
    @Field
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	
    @Column(name = "artist_path",nullable = true)
    @Field
	public String getArtistPath() {
		return artistPath;
	}
	public void setArtistPath(String artistPath) {
		this.artistPath = artistPath;
	}
	
    @Column(name = "artist_img",nullable = true)
    @Field
	public String getArtistImg() {
		return artistImg;
	}
	public void setArtistImg(String artistImg) {
		this.artistImg = artistImg;
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
