package common;

public class Validate {
    public static Boolean checkIdCustomer(String id) {
        if (id.matches("^KH-[0-9]{4}$")) {
            return true;
        }
        return false;
    }
    public static Boolean checkIdService(String id) {
        if (id.matches("^DV-[0-9]{4}$")) {
            return true;
        }
        return false;
    }
    public static Boolean checkIdCard(String idCard) {
        if (idCard.matches("^\\d{12}|\\d{9}$")) {
            return true;
        }
        return false;
    }
    public static Boolean checkIdEmail(String email) {
        if (email.matches("^\\w+@\\w+[.]\\w+$")) {
            return true;
        }
        return false;
    }
    public static Boolean checkDate(String date) {
        if (date.matches("^((19\\d{2})|(200[0-4]))-((0[1-9])|(1[0-2]))-((0[1-9])|([1-2]\\d)+|([3][0-1])+)$")) {
            return true;
        }
        return false;
    }
    public static Boolean checkNumber(int number) {
        if (Integer.toString(number).matches("^([1-9])([0-9]*)$")) {
            return true;
        }
        return false;
    }
    public static Boolean checkNumberPositive (int number) {
        if (number>=0) {
            return true;
        }
        return false;
    }
    public static Boolean checkName (String name) {
        if (name.matches("^[a-zA-Z]+$")) {
            return true;
        }
        return false;
    }

}
