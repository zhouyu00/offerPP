package team.offer.entity;

/**
 * @Author:L1ANN
 * @Description: 职位搜索的包装类，加入了公司名称，所属行业以及用户是否收藏标志
 * @Date:Created in 9:05 2018/3/6
 * @Modified By:
 */
public class PositionQuery {
    private Integer pkPositionId;

    private Integer comId;

    private String positionName;

    private String positionProperty;

    private String positionPlace;

    private String positionEducation;

    private String positionExperiment;

    private String positionSalary;

    private String positionWelfare;

    private String positionIntroduction;

    private String positionSkill;

    private String comName;

    private String comIndustry;

    private String comSize;

    private String comLocation;

    private Integer collectionFlag;

    private Integer deliverFlag;

    private String[] skills;

    public Integer getDeliverFlag() {
        return deliverFlag;
    }

    public void setDeliverFlag(Integer deliverFlag) {
        this.deliverFlag = deliverFlag;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public String getComIndustry() {
        return comIndustry;
    }

    public void setComIndustry(String comIndustry) {
        this.comIndustry = comIndustry;
    }

    public String getComSize() {
        return comSize;
    }

    public void setComSize(String comSize) {
        this.comSize = comSize;
    }

    public String getComLocation() {
        return comLocation;
    }

    public void setComLocation(String comLocation) {
        this.comLocation = comLocation;
    }

    public Integer getPkPositionId() {
        return pkPositionId;
    }

    public void setPkPositionId(Integer pkPositionId) {
        this.pkPositionId = pkPositionId;
    }

    public Integer getComId() {
        return comId;
    }

    public void setComId(Integer comId) {
        this.comId = comId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getPositionProperty() {
        return positionProperty;
    }

    public void setPositionProperty(String positionProperty) {
        this.positionProperty = positionProperty;
    }

    public String getPositionPlace() {
        return positionPlace;
    }

    public void setPositionPlace(String positionPlace) {
        this.positionPlace = positionPlace;
    }

    public String getPositionEducation() {
        return positionEducation;
    }

    public void setPositionEducation(String positionEducation) {
        this.positionEducation = positionEducation;
    }

    public String getPositionExperiment() {
        return positionExperiment;
    }

    public void setPositionExperiment(String positionExperiment) {
        this.positionExperiment = positionExperiment;
    }

    public String getPositionSalary() {
        return positionSalary;
    }

    public void setPositionSalary(String positionSalary) {
        this.positionSalary = positionSalary;
    }

    public String getPositionWelfare() {
        return positionWelfare;
    }

    public void setPositionWelfare(String positionWelfare) {
        this.positionWelfare = positionWelfare;
    }

    public String getPositionIntroduction() {
        return positionIntroduction;
    }

    public void setPositionIntroduction(String positionIntroduction) {
        this.positionIntroduction = positionIntroduction;
    }

    public String getPositionSkill() {
        return positionSkill;
    }

    public void setPositionSkill(String positionSkill) {
        this.positionSkill = positionSkill;
    }

    public String getCompanyName() {
        return comName;
    }

    public void setCompanyName(String companyName) {
        this.comName = companyName;
    }

    public String getCompanyIndustry() {
        return comIndustry;
    }

    public void setCompanyIndustry(String companyIndustry) {
        this.comIndustry = companyIndustry;
    }

    public Integer getCollectionFlag() {
        return collectionFlag;
    }

    public void setCollectionFlag(Integer collectionFlag) {
        this.collectionFlag = collectionFlag;
    }

    public String[] getSkills() {
        return skills;
    }

    public void setSkills(String[] skills) {
        this.skills = skills;
    }
    @Override
    public String toString() {
        return "PositionQuery{" +
                "pkPositionId=" + pkPositionId +
                ", comId=" + comId +
                ", positionName='" + positionName + '\'' +
                ", positionProperty='" + positionProperty + '\'' +
                ", positionPlace='" + positionPlace + '\'' +
                ", positionEducation='" + positionEducation + '\'' +
                ", positionExperiment='" + positionExperiment + '\'' +
                ", positionSalary='" + positionSalary + '\'' +
                ", positionWelfare='" + positionWelfare + '\'' +
                ", positionIntroduction='" + positionIntroduction + '\'' +
                ", positionSkill='" + positionSkill + '\'' +
                ", companyName='" + comName + '\'' +
                ", companyIndustry='" + comIndustry + '\'' +
                ", collectionFlag=" + collectionFlag +
                '}';
    }
}
