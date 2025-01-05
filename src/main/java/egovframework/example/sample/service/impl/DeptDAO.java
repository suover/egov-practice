package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {

	public String InsertDept(DeptVO vo) {
		
		return (String) insert("deptDAO.InsertDept", vo);
	}

}
