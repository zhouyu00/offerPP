package team.offer.entity;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:17 2018/1/18
 * @Modified By:
 */
public class Admin {
    private int pkAdministrator_name;
    private String administratorPassword;

    public  int getPkAdministrator_name() {
        return pkAdministrator_name;
    }

    public void setPkAdministrator_name(Integer pkAdministrator_name) {
        this.pkAdministrator_name = pkAdministrator_name;
    }

    public String getAdministratorPassword() {
        return administratorPassword;
    }

    public void setAdministratorPassword(String administratorPassword) {
        this.administratorPassword = administratorPassword;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "pkAdministrator_name=" + pkAdministrator_name +
                ", administratorPassword='" + administratorPassword + '\'' +
                '}';
    }
}
