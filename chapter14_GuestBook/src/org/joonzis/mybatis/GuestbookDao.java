package org.joonzis.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class GuestbookDao {
	//어차피 세션만 계속 사용할것이니, 팩토리를 가져와서 매번 세션을 열고 닫지 말고 세션을 받아오는 방식.
	// 이번에는 DAO를 싱글톤으로 생성하는 것이 아닌, 스태틱 메소드를 만들어서 객체 없이 사용하도록 할것.
	
	//필드
	private static SqlSession sqlsession = null;
	
	//싱글톤
	private synchronized static SqlSession getSqlSession() {
		if (sqlsession == null) {
			//factory를 선언하지 않고 바로 sqlseesion을 만든다.
			sqlsession = DBService.getFactory().openSession(false);
			// open Session(false) 수동 커밋 -> 기본 값을 수동 커밋 상태로 세션을 가져옴
		}
		return sqlsession;
	}
	
	//메소드
	//모든 메소드를 static 처리해서 별도 과정없이 GuestbookDao.메소드명()으로 불러서 사용할 수 있다.
	//sqlsession이 필요하면 위에서 정의된 getSqlSession()을 호춣하면 된다.
	
	//1. 전체검색
	public static List<GuestbookVo> select_all() {
		return getSqlSession().selectList("select_all");
	}
	
	public static GuestbookVo selectByIdx(GuestbookVo vo) {
		return getSqlSession().selectOne("select_by_idx", vo.getIdx());
	}
	
	public static int insert(GuestbookVo vo) {
		int result = getSqlSession().insert("insert", vo);
		if(result >0) {
			getSqlSession().commit();
		}
		
		return result;
	}
	
	public static int update(GuestbookVo vo) {
		int result = getSqlSession().update("update", vo);
		if(result > 0) {
			getSqlSession().commit();
		}
		
		return result;
	}
	
	public static int delete(GuestbookVo vo) {
		int result = getSqlSession().delete("delete", vo); 
		if(result > 0) {
			getSqlSession().commit();
		}
		
		return result;
	}
	
	
}
