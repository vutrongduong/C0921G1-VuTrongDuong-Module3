package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.format.ResolverStyle;
import java.util.Date;
import java.util.regex.Pattern;

public class Validate {
    public static Boolean checkKhongChuaKiTuDatBiet(String tenBenhAn) {
        if (tenBenhAn.matches("^([A-Za-z0-9]+)( [A-Za-z0-9]+)*$")) {
            return true;
        }
        return false;
    }

    public static Boolean checkTen(String ten) {
        if (ten.matches("^[a-zA-Z]+$")) {
            return true;
        }
        return false;
    }

    public static Boolean checkNgay(String ngayNhapVien, String ngayRaVien) {
        boolean flag;
        Date nhapVien = null;
        Date raVien = null;

        try {
            nhapVien = new SimpleDateFormat("yyyy-MM-dd").parse(ngayNhapVien);
            raVien = new SimpleDateFormat("yyyy-MM-dd").parse(ngayRaVien);
        } catch (ParseException e) {
            flag = false;
        }
        if (nhapVien.compareTo(raVien) > 0) {
            flag = false;
        } else if (nhapVien.compareTo(raVien) < 0) {
            flag = true;
        } else {
            flag = true;
        }
        return flag;
    }

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

    public static Boolean checkNumber(int number) {
        if (Integer.toString(number).matches("^([1-9])([0-9]*)$")) {
            return true;
        }
        return false;
    }

    public static Boolean checkNumberPositive(int number) {
        boolean flag = false;
        try {
            if (number >= 0) {
                flag = true;
            } else {
                flag = false;
            }
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    public static Boolean checkName(String name) {
        if (name.matches("^([A-Z][a-z]+)( [A-Z][a-z]+){0,6}$")) {
            return true;
        }
        return false;
    }

    public static boolean checkDateFormat(final String date) {
        boolean flag = false;
        try {
            LocalDate.parse(date, DateTimeFormatter.ofPattern("uuuu-MM-dd").withResolverStyle(ResolverStyle.STRICT));
            flag = true;
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    public static Boolean checkKiTu(String name) {
        if (name.matches("^\b+$")) {
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

    public static void main(String[] args) {
        System.out.println(Validate.checkNgay("2020-01-11", "2020-08-08"));
    }
    public static boolean phoneNumber(String phoneNumber){
        Pattern pattern = Pattern.compile("^(090\\d{7})|(091\\d{7})|(\\(84\\)\\+90\\d{7})|(\\(84\\)\\+91\\d{7})$");
        if (pattern.matcher(phoneNumber).matches()){
            return true;
        }
        return false;
    }
    public static Boolean checkKhongSo0DauTien(String date) {
        if (date.matches("^(0|[1-9][0-9]*)$")) {
            return true;
        }
        return false;
    }
}
