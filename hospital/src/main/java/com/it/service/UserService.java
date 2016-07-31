package com.it.service;


import com.it.dao.UserDao;
import com.it.pojo.User;
import com.it.util.ShiroUtil;
import com.it.util.SmallUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class UserService {
    Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserDao userDao;

    /**
     * 添加用户
     */
    public void addNewUser(User user){
        user.setCreatetime(SmallUtils.getTime());
        user.setEnable(true);
        userDao.save(user);
    }

    /**
     * 更新用户信息
     */
    public void updateUserInfor(User user){
        userDao.updateUser(user);
    }

    /**
     * 根据用户名查找用户
     */
    public User findUserByUsername(String username){
        logger.debug("username is {}",username);
        User user = userDao.findByUsername(username);
        logger.debug("user is {}",user);
        return user ;
    }


    public void updatePwd(String pwd) {
        User user = ShiroUtil.getCurrentUser();
        user.setPassword(pwd);
        userDao.update(user);
    }

    public User findUserByNameAndPwd(String password) {
        String username = ShiroUtil.getCurrentUsername();
        return userDao.findByNameAndPwd(username,password);
    }

    /**
     * 获取用户列表
     * @return admin 只有管理员能操作
     */
    public List<User> getAllUser() {
        User user = ShiroUtil.getCurrentUser();
        String role = user.getRole();
        return "admin".equals(role) ? userDao.queryAll() : null;
    }

    /**
     * 根据id查找用户
     */
    public User findUserById(Integer id) {
        return userDao.findById(id);
    }
}
