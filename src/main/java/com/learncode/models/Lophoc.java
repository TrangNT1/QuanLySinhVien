package com.learncode.models;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "qtht_lophocs")
public class Lophoc {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(length = 50, columnDefinition = "nvarchar(50)")
	private String tenlop;
	@OneToMany(mappedBy = "lophoc", fetch = FetchType.LAZY)
	Set<Giaovien> giaovien;
	
	@OneToMany(mappedBy = "lophoc", fetch = FetchType.LAZY)
	Set<Sinhvien> sinhvien;
	
	@OneToMany(mappedBy = "lophoc", fetch = FetchType.LAZY)
	Set<Thoikhoabieu> thoikhoabieu;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "giaovienid")
	private Giaovien gv;
	
	@ManyToMany(mappedBy = "lophocs", fetch = FetchType.LAZY)
	Set<Giaovien> giaoviens;
	
	public Set<Giaovien> getGiaoviens() {
		return giaoviens;
	}
	public void setGiaoviens(Set<Giaovien> giaoviens) {
		this.giaoviens = giaoviens;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "monhocid")
	private Monhoc monhoc;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sinhvienid")
	private Sinhvien sv;
	
	public Set<Sinhvien> getSinhvien() {
		return sinhvien;
	}
	public Set<Giaovien> getGiaovien() {
		return giaovien;
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

	
}
