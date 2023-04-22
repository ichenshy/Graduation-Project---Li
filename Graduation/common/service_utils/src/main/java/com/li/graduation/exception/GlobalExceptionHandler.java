package com.li.graduation.exception;

import com.li.graduation.result.ResultUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 统一异常处理类
 */
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResultUtils error(Exception e) {
        e.printStackTrace();
        return ResultUtils.fail().message("执行了全局异常处理");
    }

    @ExceptionHandler(CustomizeException.class)
    @ResponseBody
    public ResultUtils error(CustomizeException e) {
        e.printStackTrace();
        return ResultUtils.fail().code(e.getCode()).message(e.getMsg());
    }
}
