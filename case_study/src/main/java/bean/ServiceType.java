package bean;

public class ServiceType {
    private int serviceTypeId;
    private String serviceTypeName;

//    public ServiceType(String serviceTypeName) {
//        this.serviceTypeName = serviceTypeName;
//    }


    public ServiceType(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public ServiceType(int serviceTypeId, String serviceTypeName) {
        this.serviceTypeId = serviceTypeId;
        this.serviceTypeName = serviceTypeName;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    @Override
    public String toString() {
        return "ServiceType{" +
                "serviceTypeId=" + serviceTypeId +
                ", serviceTypeName='" + serviceTypeName + '\'' +
                '}';
    }
}
