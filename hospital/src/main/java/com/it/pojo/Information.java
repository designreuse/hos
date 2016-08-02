package com.it.pojo;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "t_information")
public class Information implements Serializable {

    private static final long serialVersionUID = 2260001635031946977L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String path;
    private String filename;
    private String savename;
    private String contexttype;
    private Long size;

    @ManyToOne // (fetch = FetchType.EAGER)
    @JoinColumn(name = "recordid")
    @OrderBy("id desc")
    private Record record;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Record getRecord() {
        return record;
    }

    public void setRecord(Record record) {
        this.record = record;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getSavename() {
        return savename;
    }

    public void setSavename(String savename) {
        this.savename = savename;
    }

    public String getContexttype() {
        return contexttype;
    }

    public void setContexttype(String contexttype) {
        this.contexttype = contexttype;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }
}
