package com.learncode.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "qtht_giaoviens")
public class Giaovien implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 7409588786954225727L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(length = 50, columnDefinition = "nvarchar(50)")
    private String fullname;
    @Column(length = 50, columnDefinition = "nvarchar(50)")
    private String diachi;
    @Column(length = 50, columnDefinition = "nvarchar(50)")
    private String phone;

    private Boolean gioitinh;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lophocid")
    private Lophoc lophoc;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "giaovien", cascade = CascadeType.ALL)
    List<LopHocGiaoVien> lopHocGiaoViens;

    public List<LopHocGiaoVien> getLopHocGiaoViens() {
        return lopHocGiaoViens;
    }

    public void setLopHocGiaoViens(List<LopHocGiaoVien> lopHocGiaoViens) {
        this.lopHocGiaoViens = lopHocGiaoViens;
    }

    @OneToMany(mappedBy = "giaovien", fetch = FetchType.LAZY)
    Set<Diem> diem;

    @OneToMany(mappedBy = "giaovien", fetch = FetchType.LAZY)
    Set<Thoikhoabieu> thoikhoabieu;

    public Set<Diem> getDiem() {
        return diem;
    }

    public Set<Thoikhoabieu> getThoikhoabieu() {
        return thoikhoabieu;
    }

    public Giaovien() {
        super();
    }

    public Giaovien(Integer id, String fullname, String diachi, String phone, Boolean gioitinh, Date birthday,
                    Lophoc lophoc) {
        super();
        this.id = id;
        this.fullname = fullname;
        this.diachi = diachi;
        this.phone = phone;
        this.gioitinh = gioitinh;
        this.birthday = birthday;
        this.lophoc = lophoc;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean isGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(Boolean gioitinh) {
        this.gioitinh = gioitinh;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @JsonBackReference
    public Lophoc getLophoc() {
        return lophoc;
    }

    public void setLophoc(Lophoc lophoc) {
        this.lophoc = lophoc;
    }

    public String lopHocsToString() {
        StringBuilder output = new StringBuilder("");
        if (null != this.lopHocGiaoViens && !this.lopHocGiaoViens.isEmpty()) {
            for (LopHocGiaoVien l : this.lopHocGiaoViens) {
                output.append("," + l.getLophoc().getTenlop());
            }
        } else {
            return "";
        }
        return output.substring(1);
    }
    
    public void setVav(Giaovien[] ids) { 
    	System.out.println("setter v1 -> " + ids.length);
    }
    
    public boolean isExitsLopHoc(int id) {
    	return this.lopHocGiaoViens.stream().anyMatch((e)->{return e.getLophoc().getId() == id; });
    }
}
