package bean;

public class Contract {
    private int id;
    private String startDate;
    private String endDate;
    private double deposit;
    private double totalMoney;
    private int employee;
    private int customer;
    private int service;

    public Contract() {
    }

    public Contract(int id, String startDate, String endDate, double deposit, double totalMoney, int employee, int customer, int service) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
        this.employee = employee;
        this.customer = customer;
        this.service = service;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getEmployee() {
        return employee;
    }

    public void setEmployee(int employee) {
        this.employee = employee;
    }

    public int getCustomer() {
        return customer;
    }

    public void setCustomer(int customer) {
        this.customer = customer;
    }

    public int getService() {
        return service;
    }

    public void setService(int service) {
        this.service = service;
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", deposit=" + deposit +
                ", totalMoney=" + totalMoney +
                ", employee=" + employee +
                ", customer=" + customer +
                ", service=" + service +
                '}';
    }
}
