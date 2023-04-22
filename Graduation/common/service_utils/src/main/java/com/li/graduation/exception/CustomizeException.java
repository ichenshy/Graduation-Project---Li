package com.li.graduation.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomizeException extends RuntimeException {
    private Integer code;
    private String msg;
}
