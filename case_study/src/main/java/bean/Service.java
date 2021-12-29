package bean;

public class Service {
    private int id;
    private String name;
    private int area;
    private double cost;
    private int maxPeople;
    private int rentType;
    private int type;
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double poolArea;
    private int numberOfFloors;

    public Service() {
    }

    public Service(int id, String name, int area, double cost, int maxPeople, int rentType, int type, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
        this.rentType = rentType;
        this.type = type;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
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

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public int getRentTypeId() {
        return rentType;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentType = rentTypeId;
    }

    public int getTypeId() {
        return type;
    }

    public void setTypeId(int typeId) {
        this.type = typeId;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    @Override
    public String toString() {
        return "Service{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", area=" + area +
                ", cost=" + cost +
                ", maxPeople=" + maxPeople +
                ", rentTypeId=" + rentType +
                ", typeId=" + type +
                ", standardRoom='" + standardRoom + '\'' +
                ", descriptionOtherConvenience='" + descriptionOtherConvenience + '\'' +
                ", poolArea=" + poolArea +
                ", numberOfFloors=" + numberOfFloors +
                '}';
    }
}
