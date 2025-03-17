package com.work.workusercentre.aop;

import com.work.workusercentre.annotation.AuthCheck;
import com.work.workusercentre.enums.UserRoleEnum;
import com.work.workusercentre.controller.exception.ArgumentException;
import com.work.workusercentre.controller.exception.NotRoleException;
import com.work.workusercentre.controller.response.ErrorCodeBindMessage;
import com.work.workusercentre.service.UserService;
import com.work.workusercentre.controller.vo.LoginUserVO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import jakarta.annotation.Resource;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 权限校验 AOP
 *
 * @author ljp
 */
@Slf4j
@Aspect
@Component
public class AuthInterceptor {
    @Resource
    private UserService userService;

    /**
     * 拦截 @AuthCheck 注解, 用上注解就 "必须登录、必须未封、必须满足条件(除了管理)" 才能使用
     *
     * @param joinPoint 切点
     * @param authCheck 注解
     * @return Object 对象
     */
    @Around("@annotation(authCheck)")
    public Object doInterceptor(ProceedingJoinPoint joinPoint, AuthCheck authCheck) throws Throwable {
        // 获取当前登录角色并转化为枚举体实例
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes(); // RequestContextHolder 可以获取当前线程的请求上下文
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
        LoginUserVO loginUser = userService.getLoginUserState(request);
        UserRoleEnum loginUserRoleEnum = UserRoleEnum.getEnumByCode(loginUser.getUserRole());
        // 如果没有登录, 直接拒绝
        if (loginUserRoleEnum == null) {
            throw new ArgumentException(ErrorCodeBindMessage.NOT_LOGIN_ERROR, "请先进行登录");
        }
        // 如果已被封号, 直接拒绝
        if (UserRoleEnum.BAN_ROLE.equals(loginUserRoleEnum)) {
            throw new NotRoleException(ErrorCodeBindMessage.NO_AUTH_ERROR, "您已被封号, 请联系管理员");
        }

        // 获取必须得到角色并转化为枚举体实例
        String mustRole = authCheck.mustRole();
        UserRoleEnum mustRoleEnum = UserRoleEnum.getEnumByDescription(mustRole);
        log.debug("{} , 当前登录用户角色: {}, 必须得到角色: {}", mustRole, loginUserRoleEnum, mustRoleEnum);

        // 如果没有必须得到角色, 直接放行
        if (mustRoleEnum == null) {
            return joinPoint.proceed();
        }

        // 如果用户自己是是管理员, 直接放行
        if (loginUserRoleEnum.equals(UserRoleEnum.ADMIN_ROLE)) {
            return joinPoint.proceed();
        }

        // 如果已有必须得到角色, 直接放行
        if (mustRoleEnum.equals(loginUserRoleEnum)) {
            return joinPoint.proceed();
        }

        throw new NotRoleException(ErrorCodeBindMessage.NO_AUTH_ERROR, "您没有该权限");
    }
}
