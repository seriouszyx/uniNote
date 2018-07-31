package domain;

import java.sql.Timestamp;

/**
 * @ClassName Mark
 * @Description 用于封装标签的数据
 * @Author Yixiang Zhao
 * @Date 2018/7/30 17:38
 * @Version 1.0
 */
public class Mark {
    private int id;
    private String userid;
    private String markName;
    private int isStart;
    private Timestamp createTime;
    private Timestamp updateTime;
    private int isDelete;

    @Override
    public String toString() {
        return "Mark{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", markName='" + markName + '\'' +
                ", isStart=" + isStart +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", isDelete=" + isDelete +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getMarkName() {
        return markName;
    }

    public void setMarkName(String markName) {
        this.markName = markName;
    }

    public int getIsStart() {
        return isStart;
    }

    public void setIsStart(int isStart) {
        this.isStart = isStart;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }
}

