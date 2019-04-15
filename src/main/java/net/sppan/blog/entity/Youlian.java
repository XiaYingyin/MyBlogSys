package net.sppan.blog.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tb_youlian")
public class Youlian implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1744219853139483256L;

	@Id
	@GeneratedValue
	private Long id;

	private String title;

	@Column(length = 500)
	private String url;

	private String description;

	/**
	 * 排序
	 */
	private Integer sort;

	/**
	 * 0 可见 1 隐藏
	 */
	@Column(nullable = false, columnDefinition = "Integer default 0")
	private Integer status;

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
