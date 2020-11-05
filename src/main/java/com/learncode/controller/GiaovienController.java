package com.learncode.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.learncode.ColorAlert;
import com.learncode.Utils;
import com.learncode.models.Giaovien;
import com.learncode.models.LopHocGiaoVien;
import com.learncode.models.Lophoc;
import com.learncode.models.Monhoc;
import com.learncode.services.GiaovienServices;
import com.learncode.services.LophocServices;
import com.learncode.services.MonhocServices;

@Controller
@RequestMapping("/giaovien")
public class GiaovienController {
	@Autowired
	GiaovienServices giaovienServices;

	@Autowired
	MonhocServices monhocServices;

	@Autowired
	LophocServices lophocServices;

	@ModelAttribute(name = "LOPHOC")
	public List<Lophoc> getAllLophoc() {
		return giaovienServices.findAllLophoc();
	}

	@ModelAttribute(name = "MONHOC")
	public Iterable<Monhoc> getAllMonHoc() {
		return monhocServices.findAll();
	}

	@RequestMapping("/list")
	@PreAuthorize("hasPermission('', 'LIST_GIAO_VIEN')")
	public String list(ModelMap model) {
		model.addAttribute("LIST_GIAOVIEN", giaovienServices.findAll());
		return "view-giaovien";
	}

	@GetMapping("/")
	@PreAuthorize("hasPermission('', 'SAVE_OR_UPDATE__GIAO_VIEN')")
	public String addOrEdit(ModelMap model) {
		Giaovien giaovien = new Giaovien();
		model.addAttribute("GIAOVIEN", giaovien);
		model.addAttribute("LOPHOC", lophocServices.findAll());
		model.addAttribute("ACTION", "/giaovien/saveOrUpdate");
		return "addgiaovien";
	}

	@PreAuthorize("hasPermission('', 'SAVE_OR_UPDATE__GIAO_VIEN')")
	@PostMapping("/saveOrUpdate")
	public String saveOrUpdate(ModelMap model, @ModelAttribute("GIAOVIEN") Giaovien giaovien,
			@RequestParam(name = "lopHocIds", defaultValue = "") int[] lopHocIds,
			@RequestParam(name = "monHocIds", defaultValue = "") int[] monHocIds, RedirectAttributes redir) {
		final String redirectURL = "redirect:/giaovien/edit/" + giaovien.getId();
		if (monHocIds.length == lopHocIds.length) {
			int length = lopHocIds.length; 
			List<LopHocGiaoVien> lopHocGiaoViens = new ArrayList<>();
			try {
				for (int i = 0; i < length; ++i) {
					LopHocGiaoVien lhgv = new LopHocGiaoVien();
					lhgv.setMonhoc(Objects.requireNonNull(monhocServices.findById(monHocIds[i]).get()));
					lhgv.setLophoc(Objects.requireNonNull(lophocServices.findById(lopHocIds[i]).get()));
					lhgv.setGiaovien(giaovien);
					lopHocGiaoViens.add(lhgv);
				}
				giaovien.setLopHocGiaoViens(lopHocGiaoViens);
				giaovienServices.save(giaovien);
				Utils.setMessageAlert("Cập nhật thành công", redir);
				return redirectURL;
			} catch (Exception e) {
			}
		}
		Utils.setMessageAlertError("Cập nhật thất bại", redir);
		return redirectURL;
	}

	@GetMapping("/find")
	public String findGiaovien(@RequestParam(name = "like", required = false) String name,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "limit", required = false) Integer limit, ModelMap model) {
		if (null == page)
			page = 0;
		if (null == limit)
			limit = 10;
		Pageable pageable = PageRequest.of(page, limit);
		model.addAttribute("LIST_GIAOVIEN", giaovienServices.findGiaovienContainName(name, pageable).getContent());
		return "view-gv";
	}

	@PreAuthorize("hasPermission('', 'SAVE_OR_UPDATE__GIAO_VIEN')")
	@RequestMapping("/edit/{id}")
	public String edit(ModelMap model, @PathVariable(name = "id") Integer id) {
		Optional<Giaovien> u = giaovienServices.findById(id);
		if (u.isPresent()) {
			model.addAttribute("GIAOVIEN", u.get());
		} else {
			model.addAttribute("GIAOVIEN", new Giaovien());
		}

		model.addAttribute("ACTION", "/giaovien/saveOrUpdate");
		return "addgiaovien";
	}

	@RequestMapping("/delete/{id}")
	@PreAuthorize("hasPermission('', 'DELETE__GIAO_VIEN')")
	public String delete(ModelMap model, @PathVariable(name = "id") Integer id) {
		giaovienServices.deleteById(id);
		model.addAttribute("LIST_GIAOVIEN", giaovienServices.findAll());
		return "redirect:/giaovien/list";
	}

}
