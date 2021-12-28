package bean;

public class Employee {
    private int id;
    private String name;
    private String birthDate;
    private String gender;
    private String idCard;
    Double salary;
    private String phone;
    private String email;
    private String address;
    int position;
    int educationDegree;
    int division;
    String username;

    public Employee() {
    }

    public Employee(int id, String name, String birthDate, String gender, String idCard, Double salary, String phone, String email, String address, int position, int educationDegree, int division, String username) {
        this.id = id;
        this.name = name;
        this.birthDate = birthDate;
        this.gender = gender;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.position = position;
        this.educationDegree = educationDegree;
        this.division = division;
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPositionId() {
        return position;
    }

    public void setPositionId(int positionId) {
        this.position = positionId;
    }

    public int getEducationDegreeId() {
        return educationDegree;
    }

    public void setEducationDegreeId(int educationDegreeId) {
        this.educationDegree = educationDegreeId;
    }

    public int getDivisionId() {
        return division;
    }

    public void setDivisionId(int divisionId) {
        this.division = divisionId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", gender='" + gender + '\'' +
                ", idCard='" + idCard + '\'' +
                ", salary=" + salary +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", positionId=" + position +
                ", educationDegreeId=" + educationDegree +
                ", divisionId=" + division +
                ", username='" + username + '\'' +
                '}';
    }
}
