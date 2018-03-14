package com.attend.param;

/**
 */
public class ArticleQueryParam {
    private Integer type = 0;
    private Integer memberId;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    @Override
    public String toString() {
        return "ArticleQueryParam{" +
                "type=" + type +
                '}';
    }
}
