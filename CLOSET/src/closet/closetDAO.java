package closet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class closetDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void connect_CP() {

		// 1.context.xml에 접근
		try {
			Context initctx = new InitialContext();

			// 2. name="jdbc/pool"인 커넥션풀에 접근
			DataSource ds = (DataSource) initctx.lookup("java:/comp/env/jdbc/pool");

			// 3.커넥션 풀에서 하나의 커넥션을 할당받음
			con = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		try {
			if (con != null)
				con.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertMember(closetBean cbean) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			connect_CP();

			String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cbean.getMember_email());
			pstmt.setString(2, cbean.getMember_pw());
			pstmt.setString(3, cbean.getMember_name());
			pstmt.setString(4, cbean.getMember_tel1());
			pstmt.setString(5, cbean.getMember_tel2());
			pstmt.setString(6, cbean.getMember_tel3());
			pstmt.setString(7, cbean.getMember_post());
			pstmt.setString(8, cbean.getMember_addr1());
			pstmt.setString(9, cbean.getMember_addr2());

			pstmt.executeUpdate();
			System.out.println("insertMember():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	public ArrayList<closetBean> getAllMember() {
		ArrayList<closetBean> cList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setMember_email(rs.getString("member_email"));
				cbean.setMember_pw(rs.getString("member_pw"));
				cbean.setMember_name(rs.getString("member_name"));
				cbean.setMember_tel1(rs.getString("member_tel1"));
				cbean.setMember_tel2(rs.getString("member_tel2"));
				cbean.setMember_tel3(rs.getString("member_tel3"));
				cbean.setMember_post(rs.getString("member_post"));
				cbean.setMember_addr1(rs.getString("member_addr1"));
				cbean.setMember_addr2(rs.getString("member_addr2"));
				cList.add(cbean);

				System.out.println("getAllMember() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cList;

	}

	public closetBean getOnemember(String member_email) {
		closetBean cbean = new closetBean();
		connect_CP();

		try {
			String sql = "select * from member where member_email=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cbean.setMember_email(rs.getString("member_email"));
				cbean.setMember_pw(rs.getString("member_pw"));
				cbean.setMember_name(rs.getString("member_name"));
				cbean.setMember_tel1(rs.getString("member_tel1"));
				cbean.setMember_tel2(rs.getString("member_tel2"));
				cbean.setMember_tel3(rs.getString("member_tel3"));
				cbean.setMember_post(rs.getString("member_post"));
				cbean.setMember_addr1(rs.getString("member_addr1"));
				cbean.setMember_addr2(rs.getString("member_addr2"));

				System.out.println("getOnemember() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cbean;
	}

	public void modifyMember(closetBean cbean) {
		connect_CP();

		try {
			String sql = "update member set member_email=member_email, member_pw=?, member_name=?, member_tel1=?, member_tel2=?,"
					+ "member_tel3=?, member_post=?, member_addr1=?, member_addr2=? where member_email=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cbean.getMember_pw());
			pstmt.setString(1, cbean.getMember_name());
			pstmt.setString(3, cbean.getMember_tel1());
			pstmt.setString(4, cbean.getMember_tel2());
			pstmt.setString(5, cbean.getMember_tel3());
			pstmt.setString(6, cbean.getMember_post());
			pstmt.setString(7, cbean.getMember_addr1());
			pstmt.setString(8, cbean.getMember_addr2());
			pstmt.setString(9, cbean.getMember_email());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	public void deleteMember(String member_email) {
		connect_CP();

		try {
			String sql = "delete from member where member_email=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_email);
			pstmt.executeUpdate();
			System.out.println("deleteMember():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	// commision.jsp
	public void insertReferral(closetBean cbean, String member_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			connect_CP();

			String sql = "insert into referral values(referral_seq.nextVal,?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_email);
			pstmt.setString(2, cbean.getReferral_sex());
			pstmt.setInt(3, cbean.getReferral_outer());
			pstmt.setInt(4, cbean.getReferral_top());
			pstmt.setInt(5, cbean.getReferral_bottom());
			pstmt.setInt(6, cbean.getReferral_skirt());
			pstmt.setString(7, cbean.getReferral_visit());
			pstmt.setString(8, cbean.getReferral_office());
			pstmt.setString(9, cbean.getReferral_agreement());

			pstmt.executeUpdate();
			System.out.println("insertReferral():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();

	}

	public ArrayList<closetBean> getReferral(String member_email) {
		ArrayList<closetBean> cList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select * from referral" + " where referral_username=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_email);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 빈즈 클래스 생성
				closetBean cbean = new closetBean();
				cbean.setReferral_num(rs.getInt("referral_num"));
				cbean.setReferral_username(member_email);
				cbean.setReferral_sex(rs.getString("referral_sex"));
				cbean.setReferral_outer(rs.getInt("referral_outer"));
				cbean.setReferral_top(rs.getInt("referral_top"));
				cbean.setReferral_bottom(rs.getInt("referral_bottom"));
				cbean.setReferral_skirt(rs.getInt("referral_skirt"));
				cbean.setReferral_visit(rs.getString("referral_visit"));
				cbean.setReferral_office(rs.getString("referral_office"));
				cbean.setReferral_agreement(rs.getString("referral_agreement"));
				cbean.setReferral_visit(rs.getString("referral_visit"));
				cbean.setReferral_date(rs.getDate("referral_date"));
				cList.add(cbean);

				System.out.println("getAllReferral() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cList;

	}

	public closetBean getOneReferral(int referral_num) {
		closetBean cbean = new closetBean();
		connect_CP();

		try {
			String sql = "select * from referral where referral_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, referral_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cbean.setReferral_num(rs.getInt("referral_num"));
				cbean.setReferral_username(rs.getString("referral_username"));
				cbean.setReferral_sex(rs.getString("referral_sex"));
				cbean.setReferral_outer(rs.getInt("referral_outer"));
				cbean.setReferral_top(rs.getInt("referral_top"));
				cbean.setReferral_bottom(rs.getInt("referral_bottom"));
				cbean.setReferral_skirt(rs.getInt("referral_skirt"));
				cbean.setReferral_visit(rs.getString("referral_visit"));
				cbean.setReferral_office(rs.getString("referral_office"));
				cbean.setReferral_agreement(rs.getString("referral_agreement"));
				cbean.setReferral_visit(rs.getString("referral_visit"));
				cbean.setReferral_date(rs.getDate("referral_date"));

				System.out.println("getOneReferral() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cbean;
	}

	public ArrayList<closetBean> getAllReferral() {
		ArrayList<closetBean> cList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select * from referral";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setReferral_num(rs.getInt("referral_num"));
				cbean.setReferral_username(rs.getString("referral_username"));
				cbean.setReferral_sex(rs.getString("referral_sex"));
				cbean.setReferral_outer(rs.getInt("referral_outer"));
				cbean.setReferral_top(rs.getInt("referral_top"));
				cbean.setReferral_bottom(rs.getInt("referral_bottom"));
				cbean.setReferral_skirt(rs.getInt("referral_skirt"));
				cbean.setReferral_visit(rs.getString("referral_visit"));
				cbean.setReferral_office(rs.getString("referral_office"));
				cbean.setReferral_agreement(rs.getString("referral_agreement"));
				cbean.setReferral_visit(rs.getString("referral_visit"));
				cbean.setReferral_date(rs.getDate("referral_date"));
				cList.add(cbean);

				System.out.println("getAllReferral() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cList;

	}

	// register.jsp
	public void insertRegister(closetBean cbean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			connect_CP();

			String sql = "insert into register values(register_seq.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cbean.getRegister_username());
			pstmt.setString(2, cbean.getRegister_sex());
			pstmt.setString(3, cbean.getRegister_category());
			pstmt.setString(4, cbean.getRegister_price());
			pstmt.setString(5, cbean.getRegister_size());
			pstmt.setString(6, cbean.getRegister_name());
			pstmt.setString(7, cbean.getRegister_color());
			pstmt.setString(8, cbean.getRegister_office());
			pstmt.setString(9, cbean.getRegister_mainimg());
			pstmt.setString(10, cbean.getRegister_detailimg1());
			pstmt.setString(11, cbean.getRegister_detailimg2());
			pstmt.setString(12, cbean.getRegister_detailimg3());
			pstmt.setString(13, cbean.getRegister_detailimg4());

			pstmt.executeUpdate();
			System.out.println("insertRegister():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	// reigster_list.jsp
	public ArrayList<closetBean> getAllRegister() {
		ArrayList<closetBean> rList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select * from register";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_username(rs.getString("register_username"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));
				rList.add(cbean);

				System.out.println("getAllRegister() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return rList;

	}

	// register_revise.jsp
	public closetBean getOneRegister(int register_num, String member_email) {
		closetBean cbean = new closetBean();
		connect_CP();

		try {
			String sql = "select * from register where register_num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, register_num);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_username(rs.getString("register_username"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));

			}
			System.out.println("getOneRegister() : 오라클 데이터베이스 처리 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();

		return cbean;
	}

	// cart.jsp
	public closetBean getOneCartRegister(int register_num) {
		closetBean cbean = new closetBean();
		connect_CP();

		try {
			String sql = "select * from register where register_num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, register_num);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
			}
			System.out.println("getOneCartRegister() : 장바구니 이미지 오라클 데이터베이스 처리 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();

		return cbean;
	}

	// register_revise/reviseProc.jsp
	public void modifyRegister(closetBean cbean) {
		connect_CP();
		try {

			String sql = "update register set register_sex = ?, register_category = ?, register_size = ?, "
					+ "	register_name = ?, register_color = ?, register_price = ?, register_office = ?, "
					+ "register_mainimg = ?, register_detailimg1 = ?,register_detailimg2 = ?,register_detailimg3 = ?,register_detailimg4 = ? where register_num = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cbean.getRegister_sex());
			pstmt.setString(2, cbean.getRegister_category());
			pstmt.setString(3, cbean.getRegister_size());
			pstmt.setString(4, cbean.getRegister_name());
			pstmt.setString(5, cbean.getRegister_color());
			pstmt.setString(6, cbean.getRegister_price());
			pstmt.setString(7, cbean.getRegister_office());
			pstmt.setString(8, cbean.getRegister_mainimg());
			pstmt.setString(9, cbean.getRegister_detailimg1());
			pstmt.setString(10, cbean.getRegister_detailimg2());
			pstmt.setString(12, cbean.getRegister_detailimg3());
			pstmt.setString(12, cbean.getRegister_detailimg4());
			pstmt.setInt(13, cbean.getRegister_num());

			pstmt.executeUpdate();

			System.out.println("modifyRegister():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	public int loginCheck(String id, String pw) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
		int x = -1;

		try {
			connect_CP();

			// 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
			String sql = "SELECT member_pw FROM member WHERE member_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 입력된 아이디에 해당하는 비번 있을경우
			{
				dbPW = rs.getString("member_pw"); // pw를 변수에 넣는다.

				if (dbPW.equals(pw))
					x = 1; // 넘겨받은 pw와 꺼내온 pw 비교. 같으면 인증 성공
				else
					x = 0; // DB의 pw와 입력받은 비밀번호 비교. 다르면 인증 실패

			} else {
				x = -1; // 해당 아이디가 없을 경우
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return x;
	}

	public int passCheck(String id, String pw) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String dbPW = "";
		int x = -1;

		try {
			connect_CP();
			String sql = "SELECT member_pw FROM member WHERE member_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbPW = rs.getString("member_pw");

				if (dbPW.equals(pw))
					x = 1;
				else
					x = 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return x;
	}

	// 자원봉사
	public void insertVolunteer(closetBean cbean, String member_email) {
		connect_CP();

		try {
			String sql = "insert into volunteer values(volunteer_seq.nextval,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_email);
			pstmt.setString(2, cbean.getVolunteer_date());
			pstmt.setString(3, cbean.getVolunteer_time());
			pstmt.setString(4, cbean.getVolunteer_office());

			pstmt.executeUpdate();
			System.out.println("insertVolunteer():오라클  데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	public ArrayList<closetBean> getAllVolunteer() {
		ArrayList<closetBean> cList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select * from volunteer";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setVolunteer_num(rs.getInt("volunteer_num"));
				cbean.setVolunteer_username(rs.getString("volunteer_username"));
				cbean.setVolunteer_date(rs.getString("volunteer_date"));
				cbean.setVolunteer_time(rs.getString("volunteer_time"));
				cbean.setVolunteer_office(rs.getString("volunteer_office"));
				cList.add(cbean);

				System.out.println("getAllMember() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cList;

	}

	public ArrayList<closetBean> getVolunteer(String member_email) {
		ArrayList<closetBean> cList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select * from volunteer" + " where volunteer_username=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setVolunteer_num(rs.getInt("volunteer_num"));
				cbean.setVolunteer_username(rs.getString("volunteer_username"));
				cbean.setVolunteer_date(rs.getString("volunteer_date"));
				cbean.setVolunteer_time(rs.getString("volunteer_time"));
				cbean.setVolunteer_office(rs.getString("volunteer_office"));
				cList.add(cbean);

				System.out.println("getAllReferral() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cList;
	}

	// 이메일 중복 확인 위한 코드
	private static closetDAO instance = new closetDAO();

	public static closetDAO getInstance() {
		return instance;
	}

	// 이메일 중복 확인
	public int emailConfirm(String member_email) throws Exception {
		connect_CP();
		int x = -1;
		try {
			pstmt = con.prepareStatement("select member_email from member where member_email = ?");
			pstmt.setString(1, member_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1; // 아이디중복
			} else {
				x = -1; // 아이디없음
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return x;
	}

	// 정장 검색
	public ArrayList<closetBean> getMemberList(String KeyWord) {

		connect_CP();

		ArrayList<closetBean> list = new ArrayList<closetBean>();
		try {
			String sql = "select * from register";

			if (KeyWord != null && !KeyWord.equals("")) {
				sql += " WHERE register_name LIKE '%" + KeyWord.trim() + "%' order by register_category";
			} else {// 모든 레코드 검색
				sql += "order by register_category";
			}
			System.out.println("sql = " + sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setNum(rs.getInt(1));
				cbean.setName(rs.getString(5));
				cbean.setOffice(rs.getString(7));
				cbean.setMainimg(rs.getString(8));

				list.add(cbean);
			}
		} catch (Exception e) {

		} finally {
			disconnect();
		}
		return list;
	}

	// suitdetail.jsp
	public void insertReview(int register_num, closetBean cbean, String member_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			connect_CP();

			String sql = "insert into review values(review_seq.nextVal,?,?,?,?,sysdate,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, register_num);
			pstmt.setString(2, cbean.getReview_title());
			pstmt.setString(3, cbean.getReview_content());
			pstmt.setString(4, cbean.getReview_img());
			pstmt.setString(5, member_email);

			pstmt.executeUpdate();
			System.out.println("insertReview():오라클 데이터베이스 처리");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	public ArrayList<closetBean> getAllReview() {
		ArrayList<closetBean> rList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select * from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setReview_num(rs.getInt("review_num"));
				cbean.setReview_title(rs.getString("review_title"));
				cbean.setReview_content(rs.getString("review_content"));
				cbean.setReview_img(rs.getString("review_img"));
				cbean.setReview_date(rs.getDate("review_date"));
				cbean.setReview_username(rs.getString("review_username"));
				rList.add(cbean);

				System.out.println("getAllReview() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return rList;
	}

	public closetBean getOneReview(int review_num) {
		closetBean cbean = new closetBean();
		connect_CP();

		try {
			String sql = "select * from review where review_num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, review_num);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				cbean.setReview_num(rs.getInt("review_num"));
				cbean.setReview_title(rs.getString("review_title"));
				cbean.setReview_content(rs.getString("review_content"));
				cbean.setReview_img(rs.getString("review_img"));
				cbean.setReview_date(rs.getDate("review_date"));
			}
			System.out.println("getOneReview() : 오라클 데이터베이스 처리 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();

		return cbean;
	}

	public void modifyReview(closetBean cbean) {
		connect_CP();
		try {
			String sql = "update review set review_title = ?, review_content = ?, review_img = ?  where review_num = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, cbean.getReview_title());
			pstmt.setString(2, cbean.getReview_content());
			pstmt.setString(3, cbean.getReview_img());
			pstmt.setInt(4, cbean.getReview_num());

			pstmt.executeUpdate();

			System.out.println("modifyReview():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
	}

	public int mreviewCount(String member_email) {
		connect_CP();
		int count = 0;
		try {
			String sql = "select count(*) from review where review_username=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_email);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}

			System.out.println("reviewCount():오라클 데이터베이스 처리" + count);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return count;
	}

	public ArrayList<closetBean> getMemberReview(int startRow, int endRow, String member_email) {
		ArrayList<closetBean> list = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select rn, register_num, register_name, register_mainimg"
					+ " from (select rownum as rn, a.register_num, a.register_name, a.register_mainimg from register a , review b"
					+ " where a.register_num = b.register_num" + " and b.review_username=?)" + " where rn>=? and rn<=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_email);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();

				cbean.setRn(rs.getInt("rn"));
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				list.add(cbean);

				System.out.println("getReviewLists() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return list;

	}

	// 멤버가 작성한 리뷰목록에서 하나의 리뷰보기
	public closetBean getMemberOneReview(String member_email, int register_num) {
		closetBean cbean = new closetBean();
		connect_CP();

		try {
			String sql = "select a.register_num, b.review_username, a.register_sex, a.register_category,"
					+ " a.register_price, a.register_size, a.register_name, a.register_color, a.register_office,"
					+ " a.register_mainimg, a.register_detailimg1, a.register_detailimg2, a.register_detailimg3, a.register_detailimg4,"
					+ " b.review_title, b.review_content, b.review_img" + " from register a , review b"
					+ " where a.register_num = b.register_num" + " and a.register_num=?" + " and review_username=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, register_num);
			pstmt.setString(2, member_email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setReview_username(rs.getString("review_username"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));
				cbean.setReview_title(rs.getString("review_title"));
				cbean.setReview_content(rs.getString("review_content"));
				cbean.setReview_img(rs.getString("review_img"));

				System.out.println("getMemberOneReview() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cbean;
	}

	// 검색 별 페이지 수 가져오기
	public int SearchCount(String KeyWord) {
		connect_CP();
		int count = 0;
		try {
			String sql = "select count(*) from register";

			if (KeyWord != null && !KeyWord.equals("")) {
				sql += " WHERE register_name LIKE '%" + KeyWord.trim() + "%' order by register_num desc";
			} else {// 모든 레코드 검색
				sql += " order by register_num desc";
			}
			System.out.println("sql = " + sql);

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("SearchCount():오라클 데이터베이스 처리" + count);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return count;
	}

	public ArrayList<closetBean> getSuitList(int startRow, int endRow, String KeyWord) {

		connect_CP();

		ArrayList<closetBean> list = new ArrayList<closetBean>();
		try {
			String sql = "select rn, register_num, register_username, register_sex, register_category, register_price,"
					+ " register_size, register_name, register_color, register_office, register_mainimg,"
					+ " register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4"
					+ " from (select rownum as rn, register_num, register_username, register_sex, register_category, register_price,"
					+ " register_size, register_name, register_color, register_office, register_mainimg,"
					+ " register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4" + " from";

			if (KeyWord != null && !KeyWord.equals("")) {
				sql += " (select *from register where register_name like '%" + KeyWord.trim() + "%'))"
						+ " where rn>=? and rn <=?" + " order by register_num desc";
			} else {// 모든 레코드 검색
				sql += " (select *from register))" + " where rn>=? and rn <=?" + " order by register_num desc";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				closetBean cbean = new closetBean();

				cbean.setRn(rs.getInt("rn"));
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_username(rs.getString("register_username"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));
				list.add(cbean);

				System.out.println("getSuitList() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return list;

	}

	// 카테고리 별 페이지 수 가져오기
	public int KindCount(String Kind) {
		connect_CP();
		int count = 0;
		try {
			String sql = "select count(*) from register where register_category like '%" + Kind + "%'";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("KindCount():오라클 데이터베이스 처리" + count);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return count;
	}

	public ArrayList<closetBean> getRegisterKind(int startRow, int endRow, String Kind) {
		ArrayList<closetBean> list = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select rn, register_num, register_username, register_sex, register_category,"
					+ " register_price, register_size, register_name, register_color, register_office,"
					+ " register_mainimg, register_detailimg1, register_detailimg2, register_detailimg3,"
					+ " register_detailimg4 from (select rownum as rn, register_num, register_username,"
					+ " register_sex, register_category, register_price, register_size, register_name,"
					+ " register_color, register_office, register_mainimg, register_detailimg1, register_detailimg2,"
					+ " register_detailimg3, register_detailimg4"
					+ " from (select *from register where register_category like '%" + Kind + "%'))"
					+ " where rn>=? and rn <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();

				cbean.setRn(rs.getInt("rn"));
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_username(rs.getString("register_username"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));
				list.add(cbean);

				System.out.println("getLists() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return list;

	}

	// 구청별 별 페이지 수 가져오기
	public int OfficeCount(String Office) {
		connect_CP();
		int count = 0;
		try {
			String sql = "select count(*) from register where register_office = '" + Office + "'";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("OfficeCount():오라클 데이터베이스 처리" + count);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return count;
	}

	public ArrayList<closetBean> getRegisterOffice(int startRow, int endRow, String Office) {
		ArrayList<closetBean> list = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select rn, register_num, register_username, register_sex, register_category,"
					+ " register_price, register_size, register_name, register_color, register_office, register_mainimg,"
					+ " register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4"
					+ " from (select rownum as rn, register_num, register_username, register_sex, register_category,"
					+ " register_price, register_size, register_name, register_color, register_office, register_mainimg,"
					+ " register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4"
					+ " from (select *from register where register_office = '" + Office + "'))"
					+ " where rn>=? and rn <=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setRn(rs.getInt("rn"));
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_username(rs.getString("register_username"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));
				list.add(cbean);

				System.out.println("getLists() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return list;

	}

//페이지 수 가져오기
	public int getCount() {
		connect_CP();
		int count = 0;
		try {
			String sql = "select count(*) from register";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}

			System.out.println("getCount():오라클 데이터베이스 처리" + count);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return count;
	}

	// 게시판 전체 글 가져오기
	public ArrayList<closetBean> getLists(int startRow, int endRow) {
		ArrayList<closetBean> list = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select rn, register_num, register_username, register_sex, register_category, register_price, register_size, register_name, register_color, register_office, register_mainimg, register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4"
					+ " from (select rownum as rn, register_num, register_username, register_sex, register_category, register_price, register_size, register_name, register_color, register_office, register_mainimg, register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4"
					+ " from (select *from register))" + " where rn>=? and rn <= ? " + " order by register_num desc";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setRn(rs.getInt("rn"));
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_username(rs.getString("register_username"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));
				list.add(cbean);

				System.out.println("getLists() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return list;

	}

	// 리뷰 페이징
	public int reviewCount() {
		connect_CP();
		int count = 0;
		try {
			String sql = "select count(*) from review";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}

			System.out.println("reviewCount():오라클 데이터베이스 처리" + count);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return count;
	}

	public ArrayList<closetBean> getRivewLists(int startRow, int endRow, int register_num) {
		ArrayList<closetBean> list = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select rn, review_num, register_num, review_title, review_content, review_img, review_date, review_username"
					+ " from (select rownum as rn, review_num, register_num, review_title, review_content, review_img, review_date, review_username"
					+ " from(select *from review) )" + " where rn>=? and rn <= ?" + " and register_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, register_num);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();

				cbean.setRn(rs.getInt("rn"));
				cbean.setReview_num(rs.getInt("review_num"));
				cbean.setReview_title(rs.getString("review_title"));
				cbean.setReview_content(rs.getString("review_content"));
				cbean.setReview_img(rs.getString("review_img"));
				cbean.setReview_date(rs.getDate("review_date"));
				cbean.setReview_username(rs.getString("review_username"));
				list.add(cbean);

				System.out.println("getReviewLists() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return list;

	}

	// apply
	public void insertApply(closetBean cbean, int apply_suitnum, String apply_username) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			connect_CP();

			String sql = "insert into apply values(apply_seq.nextVal,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, apply_suitnum);
			pstmt.setString(2, apply_username);
			pstmt.setString(3, cbean.getApply_suitname());
			pstmt.setString(4, cbean.getApply_extend());
			pstmt.setString(5, cbean.getApply_return());
			pstmt.setString(6, cbean.getApply_period1());
			pstmt.setString(7, cbean.getApply_period2());
			pstmt.setString(8, cbean.getApply_price());

			pstmt.executeUpdate();
			System.out.println("insertApply():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

	public ArrayList<closetBean> getAllApplyList() {
		ArrayList<closetBean> aList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select a.*, r.register_office from apply a, register r where a.apply_suitnum = r.register_num";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();

				cbean.setApply_num(rs.getInt("apply_num"));
				cbean.setApply_suitnum(rs.getInt("apply_suitnum"));
				cbean.setApply_username(rs.getString("apply_username"));
				cbean.setApply_suitname(rs.getString("apply_suitname"));
				cbean.setApply_period1(rs.getString("apply_period1"));
				cbean.setApply_period2(rs.getString("apply_period2"));
				cbean.setApply_return(rs.getString("apply_return"));
				cbean.setApply_extend(rs.getString("apply_extend"));
				cbean.setRegister_office(rs.getString("register_office"));

				aList.add(cbean);

				System.out.println("getAllApplyList() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return aList;
	}

	// 마이페이지 이용신청서
	public ArrayList<closetBean> getApply(String member_email) {
		ArrayList<closetBean> cList = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select a.apply_suitnum, r.register_mainimg, a.apply_suitname, a.apply_period1, a.apply_period2, a.apply_return from register r, apply a"
					+ " where r.register_num=a.apply_suitnum" + " and a.apply_username=? order by a.apply_suitnum desc";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setApply_suitnum(rs.getInt("apply_suitnum"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setApply_suitname(rs.getString("apply_suitname"));
				cbean.setApply_period1(rs.getString("apply_period1"));
				cbean.setApply_period2(rs.getString("apply_period2"));
				cbean.setApply_return(rs.getString("apply_return"));

				cList.add(cbean);
			}
			System.out.println("getApply() : 오라클 데이터베이스 처리 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return cList;
	}

	public int getSexCount(String Sex) {
		connect_CP();
		int count = 0;
		try {
			String sql = "select count(*) from register where register_sex = '" + Sex + "'";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}

			System.out.println("getSexCount():오라클 데이터베이스 처리" + count);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return count;
	}

	public ArrayList<closetBean> getSexLists(int startRow, int endRow, String Sex) {
		ArrayList<closetBean> list = new ArrayList<>();
		connect_CP();

		try {
			String sql = "select rn, register_num, register_sex, register_category, register_price, register_size, register_name, register_color, register_office, register_mainimg, register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4"
					+ " from (select rownum as rn, register_num, register_sex, register_category, register_price, register_size, register_name, register_color, register_office, register_mainimg, register_detailimg1, register_detailimg2, register_detailimg3, register_detailimg4"
					+ " from (select *from register))" + " where rn>=? and rn <= ?" + "and register_sex='" + Sex + "'";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				closetBean cbean = new closetBean();
				cbean.setRn(rs.getInt("rn"));
				cbean.setRegister_num(rs.getInt("register_num"));
				cbean.setRegister_sex(rs.getString("register_sex"));
				cbean.setRegister_category(rs.getString("register_category"));
				cbean.setRegister_price(rs.getString("register_price"));
				cbean.setRegister_size(rs.getString("register_size"));
				cbean.setRegister_name(rs.getString("register_name"));
				cbean.setRegister_color(rs.getString("register_color"));
				cbean.setRegister_office(rs.getString("register_office"));
				cbean.setRegister_mainimg(rs.getString("register_mainimg"));
				cbean.setRegister_detailimg1(rs.getString("register_detailimg1"));
				cbean.setRegister_detailimg2(rs.getString("register_detailimg2"));
				cbean.setRegister_detailimg3(rs.getString("register_detailimg3"));
				cbean.setRegister_detailimg4(rs.getString("register_detailimg4"));
				list.add(cbean);

				System.out.println("getSexLists() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return list;

	}

	public closetBean getOneApply(int suit_num, String username) {
		closetBean rbean = new closetBean();
		connect_CP();

		try {

			String sql = "select r.register_num, r.register_office, r.register_name, a.apply_username,"
					+ " a.apply_extend, a.apply_return, a.apply_period1, a.apply_period2, a.apply_price"
					+ " from register r, apply a" + " where r.register_num=a.apply_suitnum"
					+ " and r.register_num = ? and a.apply_username = ? " + " order by a.apply_num desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, suit_num);
			pstmt.setString(2, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				rbean.setRegister_num(rs.getInt("register_num"));
				rbean.setRegister_office(rs.getString("register_office"));
				rbean.setRegister_name(rs.getString("register_name"));
				rbean.setApply_username(rs.getString("apply_username"));
				rbean.setApply_extend(rs.getString("apply_extend"));
				rbean.setApply_return(rs.getString("apply_return"));
				rbean.setApply_period1(rs.getString("apply_period1"));
				rbean.setApply_period2(rs.getString("apply_period2"));
				rbean.setApply_price(rs.getString("apply_price"));

				System.out.println("getOneApply() : 오라클 데이터베이스 처리 완료");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return rbean;
	}

	public void returndeleteApply(int suitnum) {
		connect_CP();

		try {
			String sql = "delete from apply where apply_suitnum = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, suitnum);
			pstmt.executeUpdate();
			System.out.println("returndeleteApply():오라클 데이터베이스 처리");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}

}
