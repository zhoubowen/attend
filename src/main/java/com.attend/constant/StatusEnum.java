package com.attend.constant;

/**
 */
public class StatusEnum {

    public enum LeaveTypeEnum{
        LEAVE(0), //请假
        TRAVEL(1); //出差
        private int type;

        LeaveTypeEnum(int type) {
            this.type = type;
        }

        public int getType() {
            return type;
        }

        public void setType(int type) {
            this.type = type;
        }
    }
}
