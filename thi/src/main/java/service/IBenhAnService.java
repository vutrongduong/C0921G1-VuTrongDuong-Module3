package service;

import bean.BenhAn;
import bean.BenhNhan;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IBenhAnService {
    List<BenhAn> display();
    List<BenhNhan> displayBenhNhan();
    Map<String,String> edit(BenhAn benhAn) throws SQLException;
    BenhAn searchId(String id);
    void delete(String id);
}
