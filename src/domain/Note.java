package domain;

import java.sql.Timestamp;

/**
 * @ClassName Note
 * @Description 笔记本类，用于封装笔记本的数据
 * @Author Yixiang Zhao
 * @Date 2018/7/20 16:54
 * @Version 1.0
 */
public class Note {
    private int id;
    private String userid;
    private String content;
    private Timestamp createTime;
    private Timestamp updateTime;
    private String markID;
    private String notebookID;
    private Timestamp remindTime;
    private int isStart;
    private int isShare;
    private int isdelete;
    private String sharedpeople;
    private String title;

    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", markID='" + markID + '\'' +
                ", notebookID='" + notebookID + '\'' +
                ", remindTime=" + remindTime +
                ", isStart=" + isStart +
                ", isShare=" + isShare +
                ", isdelete=" + isdelete +
                ", sharedpeople='" + sharedpeople + '\'' +
                ", title='" + title + '\'' +
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public String getMarkID() {
        return markID;
    }

    public void setMarkID(String markID) {
        this.markID = markID;
    }

    public String getNotebookID() {
        return notebookID;
    }

    public void setNotebookID(String notebookID) {
        this.notebookID = notebookID;
    }

    public Timestamp getRemindTime() {
        return remindTime;
    }

    public void setRemindTime(Timestamp remindTime) {
        this.remindTime = remindTime;
    }

    public int getIsStart() {
        return isStart;
    }

    public void setIsStart(int isStart) {
        this.isStart = isStart;
    }

    public int getIsShare() {
        return isShare;
    }

    public void setIsShare(int isShare) {
        this.isShare = isShare;
    }

    public int getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(int isdelete) {
        this.isdelete = isdelete;
    }

    public String getSharedpeople() {
        return sharedpeople;
    }

    public void setSharedpeople(String sharedpeople) {
        this.sharedpeople = sharedpeople;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
