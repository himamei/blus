/**
 * 
 */
package com.lh.system.service.enums;

/**
 * 每张表中的 enabled字段
 * 是否正常启用
 * 正常为：ENABLE，删除时为NOT_ENABLE
 * @author mamei
 * @version 1.0
 * @since 2021/07/26
 */
public enum EnableEnum {
	/**
     * 启用
     */
    ENABLE(1, "启用"),
    /**
     * 未启用
     */
    NOT_ENABLE(2, "未启用");

    private int index;
    private String value;

    /**
     * @param index
     * @param value
     */
    private EnableEnum(int index, String value) {
        this.index = index;
        this.value = value;
    }

    /**
     * @return the index
     */
    public int getIndex() {
        return index;
    }

    /**
     * @param index the index to set
     */
    public void setIndex(int index) {
        this.index = index;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }
}
