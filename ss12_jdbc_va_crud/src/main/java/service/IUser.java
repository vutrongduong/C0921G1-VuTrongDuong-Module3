package service;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUser {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    List<User> search(String countrySearch) throws SQLException;
    List<User> sort() throws SQLException;
}
