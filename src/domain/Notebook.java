package domain;

import java.sql.Timestamp;

/**
 * @ClassName Notebook
 * @Description 笔记本类，用于封装笔记本的数据
 * @Author Yixiang Zhao
 * @Date 2018/7/20 15:04
 * @Version 1.0
 */
public class Notebook {
    private int id;
    private String userid;
    private String bookName;
    private int isShare;
    private int isDelete;
    private Timestamp createTime;
    private Timestamp updateTime;
    private int isStart;
    private int noteNumber;
    private String sharedpeople;

    @Override
    public String toString() {
        return "Notebook{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", bookName='" + bookName + '\'' +
                ", isShare=" + isShare +
                ", isDelete=" + isDelete +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", isStart=" + isStart +
                ", noteNumber=" + noteNumber +
                ", sharedpeople='" + sharedpeople + '\'' +
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

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getIsShare() {
        return isShare;
    }

    public void setIsShare(int isShare) {
        this.isShare = isShare;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
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

    public int getIsStart() {
        return isStart;
    }

    public void setIsStart(int isStart) {
        this.isStart = isStart;
    }

    public int getNoteNumber() {
        return noteNumber;
    }

    public void setNoteNumber(int noteNumber) {
        this.noteNumber = noteNumber;
    }

    public String getSharedpeople() {
        return sharedpeople;
    }

    public void setSharedpeople(String sharedpeople) {
        this.sharedpeople = sharedpeople;
    }
}
