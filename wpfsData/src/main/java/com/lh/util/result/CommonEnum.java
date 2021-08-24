package com.lh.util.result;

public enum CommonEnum implements BaseErrorInfoInterface {
    /**
     * 数据操作错误定义
     */
    SUCCESS("200", "成功!"),
    FAIL("1000","失败"),
    BODY_NOT_MATCH("400", "请求的数据格式不符!"),
    SIGNATURE_NOT_MATCH("401", "请求的数字签名不匹配!"),
    NOT_FOUND("404", "未找到该资源!"),
    INTERNAL_SERVER_ERROR("500", "服务器内部错误!"),
    SERVER_BUSY("503", "服务器正忙，请稍后再试!"),

    //自定义错误信息
    USERNAME_ISNULL("600","用户名为空！"),
    PASSWORD_ISNULL("601","密码为空！")



    ;




    /**
     * 错误码
     */
    private String resultCode;

    /**
     * 错误描述
     */
    private String resultMsg;



    CommonEnum(String resultCode, String resultMsg) {
        this.resultCode = resultCode;
        this.resultMsg = resultMsg;
    }

    @Override
    public String getResultCode() {
        return resultCode;
    }

    @Override
    public String getResultMsg() {
        return resultMsg;
    }
}

