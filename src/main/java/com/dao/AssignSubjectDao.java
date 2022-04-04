package com.dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AssignSubjectBean;




@Repository
public class AssignSubjectDao {
	@Autowired
	JdbcTemplate stmt;
	public void assignSubject(AssignSubjectBean asgb) {
		stmt.update("insert into assignsubject (classid,subjectid) values (?,?)",asgb.getClassId(),asgb.getSubjectId());
	}
	
	public List<AssignSubjectBean> getAllAssign() {
		List<AssignSubjectBean> roles = stmt.query("select a.*,c.className,s.subjectName from assignsubject a,classes c,subject s where a.classid=c.classid and a.subjectid=s.subjectid", new BeanPropertyRowMapper<AssignSubjectBean>(AssignSubjectBean.class));
		return roles;
	}

	public void deleteAssignSubject(int assignSubjectId) {
		stmt.update("delete from assignsubject where assignsubjectid = ?", assignSubjectId);
	}
	public AssignSubjectBean getClassById(int classId) {
		AssignSubjectBean dbClass = null;

		try {
			dbClass = stmt.queryForObject("select * from assignsubject where classid = ? ",
					new BeanPropertyRowMapper<AssignSubjectBean>(AssignSubjectBean.class), new Object[] { classId });
		}catch(Exception e) {
			
		}
		return dbClass;
	}
	public AssignSubjectBean getSubjectById(int subjectId) {
		AssignSubjectBean dbSubject = null;

		try {
			dbSubject = stmt.queryForObject("select * from assignsubject where subjectid = ? ",
					new BeanPropertyRowMapper<AssignSubjectBean>(AssignSubjectBean.class), new Object[] { subjectId });
		}catch(Exception e) {
			
		}
		return dbSubject;
	}

	public void updateAssign(AssignSubjectBean asb) {
		stmt.update("update assignsubject set classid = ?,subjectid = ? where assignsubjectid = ? ",asb.getClassId(),asb.getSubjectId(),asb.getAssignSubjectId());
	}
	public AssignSubjectBean getAssignById(int assignSubjectId) {

	 AssignSubjectBean asb = stmt.queryForObject("select * from assignsubject where assignsubjectid = ? ", new BeanPropertyRowMapper<AssignSubjectBean>(AssignSubjectBean.class), new Object[] { assignSubjectId });

		return asb;
	}
	public AssignSubjectBean getAllById(int classId,int subjectId) {
		AssignSubjectBean dbAssign=null;
		try {
			dbAssign=stmt.queryForObject("select * from assignsubject where classid= ? and subjectid=?", new BeanPropertyRowMapper<AssignSubjectBean>(AssignSubjectBean.class),new Object[]{classId,subjectId});
		}catch(Exception e) {
			
		}
		return dbAssign;
	}
	public List<AssignSubjectBean> getAllAssignSubject(int examId) {
		List<AssignSubjectBean> subject = stmt.query("select a.*,s.subjectName from assignsubject a,subject s where a.subjectid=s.subjectid and classid in (select classid from exam where examid=?)", new BeanPropertyRowMapper<AssignSubjectBean>(AssignSubjectBean.class),new Object[] {examId});
		return subject;
	}
}