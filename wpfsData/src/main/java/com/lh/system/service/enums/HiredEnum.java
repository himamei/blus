/**
 *
 */
package com.lh.system.service.enums;

/**
 * 是否离职：用户使用的字段
 * @author mamei
 * @version 1.0
 * @since 2021/07/26
 */
public enum HiredEnum {
    /**
     * 在职
     */
    HIRED(1, "在职"),
    /**
     * 离职
     */
    NOT_HIRED(2, "离职");

    private int index;
    private String value;

    /**
     * @param index
     * @param value
     */
    private HiredEnum(int index, String value) {
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
