package team.offer.entity;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

public class Company {

    private Integer pkComId;

    @NotNull(message = "企业注册号不能为空")
    private Integer comNo;

   @NotEmpty(message="邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String comEmail;

    @NotEmpty(message = "密码不能为空")
    @Length(min = 6,max = 16,message = "密码必须为6-16位字符")
    private String comPassword;

    private String comName;

    private String comIndustry;

    private String comLocation;

    private String comSize;

    private String comLegalperson;

    private String comIntro;

    private String comContact;

    private Integer comPostlimit;

    private int comPass;

    public Integer getPkComId() {
        return pkComId;
    }

    public void setPkComId(Integer pkComId) {
        this.pkComId = pkComId;
    }

    public Integer getComNo() {
        return comNo;
    }

    public void setComNo(Integer comNo) {
        this.comNo = comNo;
    }

    public String getComEmail() {
        return comEmail;
    }

    public void setComEmail(String comEmail) {
        this.comEmail = comEmail == null ? null : comEmail.trim();
    }

    public String getComPassword() {
        return comPassword;
    }

    public void setComPassword(String comPassword) {
        this.comPassword = comPassword == null ? null : comPassword.trim();
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName == null ? null : comName.trim();
    }

    public String getComIndustry() {
        return comIndustry;
    }

    public void setComIndustry(String comIndustry) {
        this.comIndustry = comIndustry == null ? null : comIndustry.trim();
    }

    public String getComLocation() {
        return comLocation;
    }

    public void setComLocation(String comLocation) {
        this.comLocation = comLocation == null ? null : comLocation.trim();
    }

    public String getComSize() {
        return comSize;
    }

    public void setComSize(String comSize) {
        this.comSize = comSize;
    }

    public String getComLegalperson() {
        return comLegalperson;
    }

    public void setComLegalperson(String comLegalperson) {
        this.comLegalperson = comLegalperson == null ? null : comLegalperson.trim();
    }

    public String getComIntro() {
        return comIntro;
    }

    public void setComIntro(String comIntro) {
        this.comIntro = comIntro == null ? null : comIntro.trim();
    }

    public String getComContact() {
        return comContact;
    }

    public void setComContact(String comContact) {
        this.comContact = comContact == null ? null : comContact.trim();
    }

    public Integer getComPostlimit() {
        return comPostlimit;
    }

    public void setComPostlimit(Integer comPostlimit) {
        this.comPostlimit = comPostlimit;
    }

    public int getComPass() {
        return comPass;
    }

    public void setComPass(int comPass) {
        this.comPass = comPass;
    }

    @Override
    public String toString() {
        return "Company{" +
                "pkComId=" + pkComId +
                ", comNo=" + comNo +
                ", comEmail='" + comEmail + '\'' +
                ", comPassword='" + comPassword + '\'' +
                ", comName='" + comName + '\'' +
                ", comIndustry='" + comIndustry + '\'' +
                ", comLocation='" + comLocation + '\'' +
                ", comSize=" + comSize +
                ", comLegalperson='" + comLegalperson + '\'' +
                ", comIntro='" + comIntro + '\'' +
                ", comContact='" + comContact + '\'' +
                ", comPostlimit=" + comPostlimit +
                ", comPass=" + comPass +
                '}';
    }
}