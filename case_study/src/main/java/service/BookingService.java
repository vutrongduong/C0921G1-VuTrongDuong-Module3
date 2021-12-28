package service;

import bean.Booking;
import bean.Contract;

import java.util.List;
import java.util.Set;

public interface BookingService {
    Set<Booking> convertRead();

    List<String> convertWrite();

    List<String> convertWriteContact();

    List<Contract> convertReadContact();

    void addContact();

    void displayContact();

    void editConstracts();
}

