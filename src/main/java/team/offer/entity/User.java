package team.offer.entity;

public class User {
    private Integer pkUserId;

    private String userEmail;

    private String userPassword;

    private String userIcon;

    private String userName;

    private String userPhone;

    private Integer userAge;

    private String userAddressCountry;

    private String userAddressCity;

    private String userDirection;

    private String userStation;

    private String userExperience;

    private String userSkill;

    private String userWorkAddress;

    private String userEducation;

    private String userWorkExperience;

    private String userIntroduction;

    private Boolean userTop;

    public Integer getPkUserId() {
        return pkUserId;
    }

    public void setPkUserId(Integer pkUserId) {
        this.pkUserId = pkUserId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserIcon() {
        return userIcon;
    }

    public void setUserIcon(String userIcon) {
        this.userIcon = userIcon == null ? null : userIcon.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public Integer getUserAge() {
        return userAge;
    }

    public void setUserAge(Integer userAge) {
        this.userAge = userAge;
    }

    public String getUserAddressCountry() {
        return userAddressCountry;
    }

    public void setUserAddressCountry(String userAddressCountry) {
        this.userAddressCountry = userAddressCountry == null ? null : userAddressCountry.trim();
    }

    public String getUserAddressCity() {
        return userAddressCity;
    }

    public void setUserAddressCity(String userAddressCity) {
        this.userAddressCity = userAddressCity == null ? null : userAddressCity.trim();
    }

    public String getUserDirection() {
        return userDirection;
    }

    public void setUserDirection(String userDirection) {
        this.userDirection = userDirection == null ? null : userDirection.trim();
    }

    public String getUserStation() {
        return userStation;
    }

    public void setUserStation(String userStation) {
        this.userStation = userStation == null ? null : userStation.trim();
    }

    public String getUserExperience() {
        return userExperience;
    }

    public void setUserExperience(String userExperience) {
        this.userExperience = userExperience == null ? null : userExperience.trim();
    }

    public String getUserSkill() {
        return userSkill;
    }

    public void setUserSkill(String userSkill) {
        this.userSkill = userSkill == null ? null : userSkill.trim();
    }

    public String getUserWorkAddress() {
        return userWorkAddress;
    }

    public void setUserWorkAddress(String userWorkAddress) {
        this.userWorkAddress = userWorkAddress == null ? null : userWorkAddress.trim();
    }

    public String getUserEducation() {
        return userEducation;
    }

    public void setUserEducation(String userEducation) {
        this.userEducation = userEducation == null ? null : userEducation.trim();
    }

    public String getUserWorkExperience() {
        return userWorkExperience;
    }

    public void setUserWorkExperience(String userWorkExperience) {
        this.userWorkExperience = userWorkExperience == null ? null : userWorkExperience.trim();
    }

    public String getUserIntroduction() {
        return userIntroduction;
    }

    public void setUserIntroduction(String userIntroduction) {
        this.userIntroduction = userIntroduction == null ? null : userIntroduction.trim();
    }

    public Boolean getUserTop() {
        return userTop;
    }

    public void setUserTop(Boolean userTop) {
        this.userTop = userTop;
    }
}