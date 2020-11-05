package com.learncode.models;

import java.util.List;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "qtht_lophocs")
public class Lophoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(length = 50, columnDefinition = "nvarchar(50)")
    private String tenlop;

    @OneToMany(mappedBy = "lophoc", fetch = FetchType.LAZY)
    Set<Sinhvien> sinhvien;

    @OneToMany(mappedBy = "lophoc", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    Set<Thoikhoabieu> thoikhoabieu;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "giaovienid")
    private Giaovien gv;

    @OneToMany(mappedBy = "lophoc", fetch = FetchType.LAZY)
    List<LopHocGiaoVien> lopHocGiaoViens;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "monhocid")
    private Monhoc monhoc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sinhvienid")
    private Sinhvien sv;

    public Set<Sinhvien> getSinhvien() {
        return sinhvien;
    }

    public Set<Thoikhoabieu> getThoikhoabieu() {
        return thoikhoabieu;
    }

    public Lophoc() {
        super();
    }

    public Lophoc(Integer id, String tenlop, com.learncode.models.Giaovien giaovien, Monhoc monhoc,
                  com.learncode.models.Sinhvien sinhvien) {
        super();
        this.id = id;
        this.tenlop = tenlop;
        this.gv = giaovien;
        this.monhoc = monhoc;
        this.sv = sinhvien;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTenlop() {
        return tenlop;
    }

    public void setTenlop(String tenlop) {
        this.tenlop = tenlop;
    }

    public Monhoc getMonhoc() {
        return monhoc;
    }

    public void setMonhoc(Monhoc monhoc) {
        this.monhoc = monhoc;
    }

    public Giaovien getGv() {
        return gv;
    }

    public void setGv(Giaovien gv) {
        this.gv = gv;
    }

    public Sinhvien getSv() {
        return sv;
    }

    public void setSv(Sinhvien sv) {
        this.sv = sv;
    }

    @Override
    public String toString() {
        return "Lophoc [id=" + id + ", tenlop=" + tenlop + "]";
    }

    public List<LopHocGiaoVien> getLopHocGiaoViens() {
        return lopHocGiaoViens;
    }

    public void setLopHocGiaoViens(List<LopHocGiaoVien> lopHocGiaoViens) {
        this.lopHocGiaoViens = lopHocGiaoViens;
    }
}
