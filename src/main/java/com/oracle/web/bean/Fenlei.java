package com.oracle.web.bean;

public class Fenlei {
    
    private Integer fId;

    
    private String fname;

   
    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname == null ? null : fname.trim();
    }
}