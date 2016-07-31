package com.it.dao;


import com.it.pojo.User;
import com.it.util.SmallUtils;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;


@Named
public class UserDao extends PrimaryDao<User, Integer> {
    Logger logger = LoggerFactory.getLogger(UserDao.class);

    /**
     * 根据username 使用hql
     * @param username 参数
     * @return user
     */
    public User findByUsername(String username) {
        String hql = "from User where username = ?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, username);
//        String sql = "select * from t_user where username = ?";
//        SQLQuery query = getSession().createSQLQuery(sql).addEntity(User.class);
//        query.setParameter(1,username);
        return (User) query.uniqueResult();
    }

    /**
     * 根据用户名和密码查找用户，有些多余
     */
    public User findByNameAndPwd(String username, String password) {
        String hql = "from User where username = :name and password = :pwd";
        Query query = getSession().createQuery(hql);
        query.setParameter("name", username);
        query.setParameter("pwd", password);
        return (User) query.uniqueResult();
    }

    /**
     * 更新用户信息
     */
    public void updateUser(User user) {
        User queryUser = findById(user.getId());
        SmallUtils.copyProperties(user, queryUser);
        save(queryUser);

    }
}
