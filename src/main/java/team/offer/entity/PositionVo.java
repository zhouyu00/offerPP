package team.offer.entity;

/**
 * @Author:L1ANN
 * @Description: Position的包装类，添加了公司名称和公司所属行业
 * @Date:Created in 15:45 2018/3/3
 * @Modified By:
 */
public class PositionVo {

    private Position position;

    private String companyName;

    private String companyIndustry;

    private String[] skills;


    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyIndustry() {
        return companyIndustry;
    }

    public void setCompanyIndustry(String companyIndustry) {
        this.companyIndustry = companyIndustry;
    }

    public String[] getSkills() {
        return skills;
    }

    public void setSkills(String[] skills) {
        this.skills = skills;
    }

    @Override
    public String toString() {
        return "PositionVo{" +
                "position=" + position +
                ", companyName='" + companyName + '\'' +
                ", companyIndustry='" + companyIndustry + '\'' +
                '}';
    }
}
