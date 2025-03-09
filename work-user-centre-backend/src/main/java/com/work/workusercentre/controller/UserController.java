package com.work.workusercentre.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.work.workusercentre.entity.User;
import com.work.workusercentre.exception.ArgumentException;
import com.work.workusercentre.exception.NotRoleException;
import com.work.workusercentre.request.DeleteUserRequest;
import com.work.workusercentre.request.UserLoginRequest;
import com.work.workusercentre.request.UserRegisterRequest;
import com.work.workusercentre.response.BaseResponse;
import com.work.workusercentre.response.TheResult;
import com.work.workusercentre.service.UserService;
import com.work.workusercentre.vo.UserVO;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.work.workusercentre.contant.UserConstant.*;
import static com.work.workusercentre.response.ErrorCode.*;

/**
 * 用户控制层
 */
@RestController // 返回值默认为 json 类型
@CrossOrigin(origins = "http://localhost:3000", allowCredentials = "true") // 允许前端域访问 // TODO: 实际部署需要代理, 所以这里的注解去除更加安全
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    /**
     * 用户注册接口
     *
     * @param userRegisterRequest
     * @return 用户 id
     */
    @PostMapping("/register")
    public BaseResponse<Long> userRegister(@RequestBody UserRegisterRequest userRegisterRequest) {
        // 参数校验
        if (userRegisterRequest == null) {
            throw new ArgumentException(PARAMS_ERROR, "请求体为空");
        }

        // 处理请求
        long id = userService.userRegister(userRegisterRequest.getUserAccount(), userRegisterRequest.getUserPasswd(), userRegisterRequest.getCheckPasswd());

        // 返回响应
        return TheResult.success(id);
    }

    /**
     * 用户登入接口
     *
     * @param userLoginRequest
     * @return 脱敏后的用户信息
     */
    @PostMapping("/login")
    public BaseResponse<UserVO> userLogin(@RequestBody UserLoginRequest userLoginRequest, HttpServletRequest request) {
        // 参数校验
        if (userLoginRequest == null) {
            throw new ArgumentException(PARAMS_ERROR, "请求体为空");
        }
        if (request == null) {
            throw new ArgumentException(PARAMS_ERROR, "请求为空");
        }

        // 处理请求
        UserVO userVO = userService.userLogin(userLoginRequest.getUserAccount(), userLoginRequest.getUserPasswd(), request);

        // 返回响应
        return TheResult.success(userVO);
    }

    /**
     * 用户登出接口
     *
     * @return 是否登出成功
     */
    @PostMapping("/logout")
    public BaseResponse<Boolean> userLogout(HttpServletRequest request) {
        // 参数校验
        if (request == null) {
            throw new ArgumentException(PARAMS_ERROR, "请求为空");
        }

        // 返回响应
        return TheResult.success(userService.userLogout(request));
    }

    /**
     * 模糊查询搜索用户列表接口
     *
     * @param userName 用户名可以为空
     * @return 用户列表, 如果没有查询 id 就会得到所有用户
     */
    @GetMapping("/search")
    public BaseResponse<List<UserVO>> searchUsers(@RequestParam(required = false) String userName, HttpServletRequest request) {
        // 参数校验
        if (request == null) {
            throw new ArgumentException(PARAMS_ERROR, "请求为空");
        }

        // 权限校验
        authCheck(request); // TODO: 这里的权限需要修改为 AOP

        // 处理请求
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(userName)) {
            lambdaQueryWrapper.like(User::getUserName, userName);
        }

        List<User> userList = userService.list(lambdaQueryWrapper);

        // 返回响应
        List<UserVO> userVOList = userList
                .stream() // 转化操作, 将 userList 转换为一个流
                .map(UserVO::removeSensitiveData) // 中间操作, 将流中的每个元素都通过指定的函数进行转换
                .toList();
        return TheResult.success(userVOList); // 终端操作, 收集器 Collectors.toList() 用来将流中的元素收集到一个新的 List 中
    }

    /**
     * 删除用户接口
     *
     * @param deleteUserRequest
     * @return 是否删除成功
     */
    @PostMapping("/delete")
    public BaseResponse<Boolean> deleteUser(@RequestBody DeleteUserRequest deleteUserRequest, HttpServletRequest request) {
        // 参数校验
        if (request == null) {
            throw new ArgumentException(PARAMS_ERROR, "请求为空");
        }

        // 权限校验
        authCheck(request); // TODO: 这里的权限需要修改为 AOP
        if (deleteUserRequest.getId() <= 0) {
            throw new ArgumentException(PARAMS_ERROR, "参数用户 id 不能为空");
        }

        // 返回响应
        return TheResult.success(userService.removeById(deleteUserRequest.getId())); // 这里 MyBatisPlus 会自动转化为逻辑删除
    }

    /**
     * 身份检查方法
     *
     * @param request
     */
    private void authCheck(HttpServletRequest request) {
        if (request == null) {
            throw new ArgumentException(PARAMS_ERROR, "请求为空");
        }

        var user = (UserVO) request.getSession().getAttribute(USER_LOGIN_STA);

        if (user == null) {
            throw new ArgumentException(NOT_LOGIN_ERROR, "请先进行登录");
        }

        if (user.getUserRole() == BAN_ROLE) {
            throw new NotRoleException(NO_AUTH_ERROR, "该帐号被封禁");
        }

        if (user.getUserRole() != ADMIN_ROLE) {
            throw new NotRoleException(NO_AUTH_ERROR, "需要管理权限");
        }
    }
}
