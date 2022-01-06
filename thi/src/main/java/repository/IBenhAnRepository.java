package repository;

import bean.BenhAn;
import bean.BenhNhan;

import java.sql.SQLException;
import java.util.List;

public interface IBenhAnRepository {
    List<BenhAn> display();
    List<BenhNhan> displayBenhNhan();
    void edit(BenhAn benhAn) throws SQLException;
    BenhAn searchId(String id);
    void delete(String id);
}
