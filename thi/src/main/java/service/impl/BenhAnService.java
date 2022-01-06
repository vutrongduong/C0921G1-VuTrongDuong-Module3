package service.impl;

import bean.BenhAn;
import bean.BenhNhan;
import common.Validate;
import repository.IBenhAnRepository;
import repository.impl.BenhAnRepository;
import service.IBenhAnService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BenhAnService implements IBenhAnService {
    IBenhAnRepository benhAnRepository = new BenhAnRepository();

    @Override
    public List<BenhAn> display() {
        List<BenhAn> benhAnList = benhAnRepository.display();
        for (BenhAn benhAn : benhAnList) {
            if (Integer.parseInt(benhAn.getId()) < 10) {
                benhAn.setId("BA-00" + benhAn.getId());
            } else if (Integer.parseInt(benhAn.getId()) < 100) {
                benhAn.setId("BA-0" + benhAn.getId());
            }else {
                benhAn.setId("BA-" + benhAn.getId());
            }
            if (Integer.parseInt(benhAn.getBenhNhan().getId()) < 10) {
                benhAn.setId("BN-00" + benhAn.getId());
            } else if (Integer.parseInt(benhAn.getBenhNhan().getId()) < 100) {
                benhAn.getBenhNhan().setId("BN-0" + benhAn.getBenhNhan().getId());
            }else {
                benhAn.getBenhNhan().setId("BN-" + benhAn.getBenhNhan().getId());
            }
        }
        return benhAnList;
    }

    @Override
    public List<BenhNhan> displayBenhNhan() {
        return benhAnRepository.displayBenhNhan();
    }

    @Override
    public Map<String,String> edit(BenhAn benhAn) throws SQLException {
        Map<String,String>map=new HashMap<>();
        if(!Validate.checkBenhAn(benhAn.getLyDo())) {
            map.put("benhAn", "Tên bệnh án không chứa ký tự đặc biệt");
        }
        if (!Validate.checkTen(benhAn.getBenhNhan().getTen())) {
            map.put("ten", "Tên bệnh nhân không chứa ký tự số");
        }
        if (!Validate.checkNgay(benhAn.getNgayNhapVien(),benhAn.getNgayRaVien())) {
            map.put("ngay", "Ngày ra viện phải lớn hơn hoặc bằng ngày nhập viện");
        }
        if (map.isEmpty()){
            benhAnRepository.edit(benhAn);
        }
        return map;
    }

    @Override
    public BenhAn searchId(String id) {
        String arr[]=id.split("");
        String idTemp ="";
        for (int i = 3; i <arr.length ; i++) {
            if (!arr[i].equals("0")){
                idTemp+=arr[i];
            }
        }
        return benhAnRepository.searchId(idTemp);
    }

    @Override
    public void delete(String id) {
        String arr[]=id.split("");
        String idTemp ="";
        for (int i = 3; i <arr.length ; i++) {
            if (!arr[i].equals("0")){
                idTemp+=arr[i];
            }
        }
        benhAnRepository.delete(idTemp);
    }
}
