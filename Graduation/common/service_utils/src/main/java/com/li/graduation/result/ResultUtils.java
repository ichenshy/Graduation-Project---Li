package com.li.graduation.result;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 全局统一返回结果类
 *
 * @author Chenchenx
 */
@Data
@ApiModel(value = "全局统一返回结果")
public class ResultUtils<T> {

    @ApiModelProperty(value = "返回码")
    private Integer code;

    @ApiModelProperty(value = "返回消息")
    private String message;

    @ApiModelProperty(value = "返回数据")
    private T data;

    public ResultUtils(){}

    public static <T> ResultUtils<T> build(T body, Integer code, String message) {
        ResultUtils<T> result = new ResultUtils<T>();
        if (body != null) {
            result.setData(body);
        }
        result.setCode(code);
        result.setMessage(message);
        return result;
    }

    public static<T> ResultUtils<T> ok(){
        return ResultUtils.ok(null);
    }

    /**
     * 操作成功
     * @param data  baseCategory1List
     * @param <T>
     * @return
     */
    public static<T> ResultUtils<T> ok(T data){
        return build(data,20000,"成功");
    }

    public static<T> ResultUtils<T> fail(){
        return ResultUtils.fail(null);
    }

    /**
     * 操作失败
     * @param data
     * @param <T>
     * @return
     */
    public static<T> ResultUtils<T> fail(T data){
        return build(data, 201,"失败");
    }

    public ResultUtils<T> message(String msg){
        this.setMessage(msg);
        return this;
    }

    public ResultUtils<T> code(Integer code){
        this.setCode(code);
        return this;
    }
}
