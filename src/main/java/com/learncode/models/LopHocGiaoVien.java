package com.learncode.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "qtht_lophocs_giaoviens")
public class LopHocGiaoVien implements Serializable {
    
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lophocid")
    private Lophoc lophoc;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "giaovienid")
    private Giaovien giaovien;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "monhocid")
    private Monhoc monhoc;

    public LopHocGiaoVien(int id) {
        this.id = id;
    }

    public LopHocGiaoVien() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Lophoc getLophoc() {
        return lophoc;
    }

    public void setLophoc(Lophoc lophoc) {
        this.lophoc = lophoc;
    }

    public Giaovien getGiaovien() {
        return giaovien;
    }

    public void setGiaovien(Giaovien giaovien) {
        this.giaovien = giaovien;
    }

    public Monhoc getMonhoc() {
        return monhoc;
    }

    public void setMonhoc(Monhoc monhoc) {
        this.monhoc = monhoc;
    }
    
}
