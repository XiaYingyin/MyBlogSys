package net.sppan.blog.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "tb_resource_category")
public class ResourceCategory implements Serializable {
    private static final long serialVersionUID = -3578273403164774222L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Transient
    private List<ResourceCategory> childs;

    @Column(columnDefinition="bigint default 0")
    private Long parentId;

    private String name;

    @Column(columnDefinition="int default 0")
    private Integer type;

    @Column(columnDefinition="int default 0")
    private Integer num;

    @Column(columnDefinition="int default 0")
    private Integer status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<ResourceCategory> getChilds() {
        return childs;
    }

    public void setChilds(List<ResourceCategory> childs) {
        this.childs = childs;
    }
}
