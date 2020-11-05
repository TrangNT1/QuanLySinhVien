package com.learncode.Respositories;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.learncode.models.LopHocGiaoVien;
	
@Repository
public interface LopHocGiaoVienRepository extends CrudRepository<LopHocGiaoVien, Integer> {
     @Modifying			
     @Query(value = "delete from LopHocGiaoVien lg where lg.giaovien.id = :id")
     public void deleteFromGiaoVienId(@Param("id") Integer id);
}
