package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	public String insertDept(DeptVO vo) throws Exception;
	public List<?> selectDeptList(DeptVO vo) throws Exception;
}
