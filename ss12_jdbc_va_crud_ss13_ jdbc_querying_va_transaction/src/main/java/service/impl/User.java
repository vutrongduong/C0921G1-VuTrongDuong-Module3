package service.impl;

import repository.IUserDAO;
import repository.impl.UserDAO;
import service.IUser;

import java.sql.SQLException;
import java.util.List;

public class User implements IUser {
    IUserDAO userDAO = new UserDAO();

    @Override
    public void insertUser(bean.User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public bean.User selectUser(int id) {
        return userDAO.selectUser(id);
    }

    @Override
    public List<bean.User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDAO.deleteUser(id);
    }

    @Override
    public boolean updateUser(bean.User user) throws SQLException {
        return userDAO.updateUser(user);
    }

    @Override
    public List<bean.User> search(String countrySearch) throws SQLException {
        return userDAO.search(countrySearch);
    }

    @Override
    public List<bean.User> sort() throws SQLException {
        return userDAO.sort();
    }

    @Override
    public bean.User getUserById(int id) {
        return userDAO.getUserById(id);
    }

    @Override
    public void insertUserStore(bean.User user) throws SQLException {
        userDAO.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(bean.User user, int[] permision) {
        userDAO.addUserTransaction(user, permision);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userDAO.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        userDAO.insertUpdateUseTransaction();
    }
}
