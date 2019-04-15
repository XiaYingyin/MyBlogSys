package net.sppan.blog.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tb_options")
public class Options implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7370664893843513614L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String optionKey;

	@Column(columnDefinition = "TEXT")
	private String optionValue;

	private String description;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOptionKey() {
		return optionKey;
	}

	public void setOptionKey(String optionKey) {
		this.optionKey = optionKey;
	}

	public String getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
