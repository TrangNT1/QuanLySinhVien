package com.learncode.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.learncode.models.Giaovien;
import com.learncode.models.LopHocGiaoVien;
import com.learncode.models.Lophoc;
import com.learncode.models.Monhoc;

public class LopHocGiaoVienDTO {
	
	private List<LopHocGiaoVien> ls = new ArrayList<>();
	
	public void setLs(List<LopHocGiaoVien> ls) {
		this.ls = ls;
	}
	
	public List<LopHocGiaoVien> getList() {
		Map<String, Boolean> map = new HashMap<>();
		return this.ls;
	}
	
}
