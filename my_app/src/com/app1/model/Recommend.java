package com.app1.model;

import com.app1.model.BaseObject;

import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import javax.xml.bind.annotation.XmlRootElement;

import java.io.Serializable;

@Entity
@Table(name="recommend",catalog="test")
@Indexed
@XmlRootElement
public class Recommend extends BaseObject implements Serializable {
    private Long id;
    private String url;
    private String title;
    private String content;
    private Date createTime;
    private Long createId;
    private Long type;

    @Id @GeneratedValue(strategy=IDENTITY) @DocumentId    
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name="url", length=3000)
    @Field
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    @Column(name="title", length=450)
    @Field
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    @Column(name="content", length=3000)
    @Field
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_time", length=19)
    @Field
    public Date getCreateTime() {
        return this.createTime;
    }
    
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    
    @Column(name="create_id")
    @Field
    public Long getCreateId() {
        return this.createId;
    }
    
    public void setCreateId(Long createId) {
        this.createId = createId;
    }
    
    @Column(name="type")
    @Field
    public Long getType() {
        return this.type;
    }
    
    public void setType(Long type) {
        this.type = type;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Recommend pojo = (Recommend) o;

        if (url != null ? !url.equals(pojo.url) : pojo.url != null) return false;
        if (title != null ? !title.equals(pojo.title) : pojo.title != null) return false;
        if (content != null ? !content.equals(pojo.content) : pojo.content != null) return false;
        if (createTime != null ? !createTime.equals(pojo.createTime) : pojo.createTime != null) return false;
        if (createId != null ? !createId.equals(pojo.createId) : pojo.createId != null) return false;
        if (type != null ? !type.equals(pojo.type) : pojo.type != null) return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = (url != null ? url.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (createId != null ? createId.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);

        return result;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer(getClass().getSimpleName());

        sb.append(" [");
        sb.append("id").append("='").append(getId()).append("', ");
        sb.append("url").append("='").append(getUrl()).append("', ");
        sb.append("title").append("='").append(getTitle()).append("', ");
        sb.append("content").append("='").append(getContent()).append("', ");
        sb.append("createTime").append("='").append(getCreateTime()).append("', ");
        sb.append("createId").append("='").append(getCreateId()).append("', ");
        sb.append("type").append("='").append(getType()).append("'");
        sb.append("]");
      
        return sb.toString();
    }

}
