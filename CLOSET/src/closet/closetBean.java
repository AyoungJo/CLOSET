package closet;

import java.sql.Date;

public class closetBean {

	// 회원가입
	private String member_email; // pk
	private String member_pw;
	private String member_name;
	private String member_tel1;
	private String member_tel2;
	private String member_tel3;
	private String member_post;
	private String member_addr1;
	private String member_addr2;

	// 자원봉사자
	private int volunteer_num;
	private String volunteer_username;
	private String volunteer_date;
	private String volunteer_time;
	private String volunteer_office;

	// 위탁신청서
	private int referral_num;
	private String referral_username;
	private String referral_sex;
	private int referral_outer;
	private int referral_top;
	private int referral_bottom;
	private int referral_skirt;
	private String referral_visit;
	private String referral_office;
	private String referral_agreement;
	private Date referral_date;

	// 정장등록
	private int register_num;
	private String register_username;
	private String register_sex;
	private String register_category;
	private String register_size;
	private String register_name;
	private String register_color;
	private String register_price;
	private String register_office;
	private String register_mainimg;
	private String register_detailimg1;
	private String register_detailimg2;
	private String register_detailimg3;
	private String register_detailimg4;

	// 검색 기능
	private String mainimg;
	private String name;
	private String office;
	private int num;

	// 정장후기
	private int review_num;
	private String review_username;
	private String review_title;
	private String review_content;
	private String review_img;
	private Date review_date;

	private int rn;

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	// 장바구니
	private int basket_num;
	private String basket_img;
	private String basket_name;
	private String basket_price;
	private String basket_office;
	private String basket_vdate;
	private String basket_vtime;
	private String basket_username;

	// 이용신청
	private int apply_num;
	private int apply_suitnum;
	private String apply_username;
	private String apply_suitname;
	private String apply_extend;
	private String apply_return;
	private String apply_period1;
	private String apply_period2;
	private String apply_price;

	// signUp.jsp
	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_tel1() {
		return member_tel1;
	}

	public void setMember_tel1(String member_tel1) {
		this.member_tel1 = member_tel1;
	}

	public String getMember_tel2() {
		return member_tel2;
	}

	public void setMember_tel2(String member_tel2) {
		this.member_tel2 = member_tel2;
	}

	public String getMember_tel3() {
		return member_tel3;
	}

	public void setMember_tel3(String member_tel3) {
		this.member_tel3 = member_tel3;
	}

	public String getMember_post() {
		return member_post;
	}

	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}

	public String getMember_addr1() {
		return member_addr1;
	}

	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	// referral.jsp
	public int getReferral_num() {
		return referral_num;
	}

	public void setReferral_num(int referral_num) {
		this.referral_num = referral_num;
	}

	public String getReferral_username() {
		return referral_username;
	}

	public void setReferral_username(String referral_username) {
		this.referral_username = referral_username;
	}

	public String getReferral_sex() {
		return referral_sex;
	}

	public void setReferral_sex(String referral_sex) {
		this.referral_sex = referral_sex;
	}

	public int getReferral_outer() {
		return referral_outer;
	}

	public void setReferral_outer(int referral_outer) {
		this.referral_outer = referral_outer;
	}

	public int getReferral_top() {
		return referral_top;
	}

	public void setReferral_top(int referral_top) {
		this.referral_top = referral_top;
	}

	public int getReferral_bottom() {
		return referral_bottom;
	}

	public void setReferral_bottom(int referral_bottom) {
		this.referral_bottom = referral_bottom;
	}

	public int getReferral_skirt() {
		return referral_skirt;
	}

	public void setReferral_skirt(int referral_skirt) {
		this.referral_skirt = referral_skirt;
	}

	public String getReferral_visit() {
		return referral_visit;
	}

	public void setReferral_visit(String referral_visit) {
		this.referral_visit = referral_visit;
	}

	public String getReferral_office() {
		return referral_office;
	}

	public void setReferral_office(String referral_office) {
		this.referral_office = referral_office;
	}

	public String getReferral_agreement() {
		return referral_agreement;
	}

	public void setReferral_agreement(String referral_agreement) {
		this.referral_agreement = referral_agreement;
	}

	public Date getReferral_date() {
		return referral_date;
	}

	public void setReferral_date(Date referral_date) {
		this.referral_date = referral_date;
	}

	// register.jsp
	public int getRegister_num() {
		return register_num;
	}

	public void setRegister_num(int register_num) {
		this.register_num = register_num;
	}

	public String getRegister_username() {
		return register_username;
	}

	public void setRegister_username(String register_username) {
		this.register_username = register_username;
	}

	public String getRegister_sex() {
		return register_sex;
	}

	public void setRegister_sex(String register_sex) {
		this.register_sex = register_sex;
	}

	public String getRegister_category() {
		return register_category;
	}

	public void setRegister_category(String register_category) {
		this.register_category = register_category;
	}

	public String getRegister_size() {
		return register_size;
	}

	public void setRegister_size(String register_size) {
		this.register_size = register_size;
	}

	public String getRegister_name() {
		return register_name;
	}

	public void setRegister_name(String register_name) {
		this.register_name = register_name;
	}

	public String getRegister_color() {
		return register_color;
	}

	public void setRegister_color(String register_color) {
		this.register_color = register_color;
	}

	public String getRegister_price() {
		return register_price;
	}

	public void setRegister_price(String register_price) {
		this.register_price = register_price;
	}

	public String getRegister_office() {
		return register_office;
	}

	public void setRegister_office(String register_office) {
		this.register_office = register_office;
	}

	public String getRegister_mainimg() {
		return register_mainimg;
	}

	public void setRegister_mainimg(String register_mainimg) {
		this.register_mainimg = register_mainimg;
	}

	public String getRegister_detailimg1() {
		return register_detailimg1;
	}

	public void setRegister_detailimg1(String register_detailimg1) {
		this.register_detailimg1 = register_detailimg1;
	}

	public String getRegister_detailimg2() {
		return register_detailimg2;
	}

	public void setRegister_detailimg2(String register_detailimg2) {
		this.register_detailimg2 = register_detailimg2;
	}

	public String getRegister_detailimg3() {
		return register_detailimg3;
	}

	public void setRegister_detailimg3(String register_detailimg3) {
		this.register_detailimg3 = register_detailimg3;
	}

	public String getRegister_detailimg4() {
		return register_detailimg4;
	}

	public void setRegister_detailimg4(String register_detailimg4) {
		this.register_detailimg4 = register_detailimg4;
	}

	// 검색기능(suitsearch.jsp)
	public void setName(String name) {
		// TODO Auto-generated method stub
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public String getMainimg() {
		return mainimg;
	}

	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	// suitdetail_review.jsp
	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_username() {
		return review_username;
	}

	public void setReview_username(String review_username) {
		this.review_username = review_username;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	// cart.jsp(Proc)
	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}

	public String getBasket_img() {
		return basket_img;
	}

	public void setBasket_img(String basket_img) {
		this.basket_img = basket_img;
	}

	public String getBasket_name() {
		return basket_name;
	}

	public void setBasket_name(String basket_name) {
		this.basket_name = basket_name;
	}

	public String getBasket_price() {
		return basket_price;
	}

	public void setBasket_price(String basket_price) {
		this.basket_price = basket_price;
	}

	public String getBasket_office() {
		return basket_office;
	}

	public void setBasket_office(String basket_office) {
		this.basket_office = basket_office;
	}

	public String getBasket_vdate() {
		return basket_vdate;
	}

	public void setBasket_vdate(String basket_vdate) {
		this.basket_vdate = basket_vdate;
	}

	public String getBasket_vtime() {
		return basket_vtime;
	}

	public void setBasket_vtime(String basket_vtime) {
		this.basket_vtime = basket_vtime;
	}

	public String getBasket_username() {
		return basket_username;
	}

	public void setBasket_username(String basket_username) {
		this.basket_username = basket_username;
	}

	// apply
	public int getApply_num() {
		return apply_num;
	}

	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}

	public int getApply_suitnum() {
		return apply_suitnum;
	}

	public void setApply_suitnum(int apply_suitnum) {
		this.apply_suitnum = apply_suitnum;
	}

	public String getApply_username() {
		return apply_username;
	}

	public void setApply_username(String apply_username) {
		this.apply_username = apply_username;
	}

	public String getApply_suitname() {
		return apply_suitname;
	}

	public void setApply_suitname(String apply_suitname) {
		this.apply_suitname = apply_suitname;
	}

	public String getApply_extend() {
		return apply_extend;
	}

	public void setApply_extend(String apply_extend) {
		this.apply_extend = apply_extend;
	}

	public String getApply_return() {
		return apply_return;
	}

	public void setApply_return(String apply_return) {
		this.apply_return = apply_return;
	}

	public String getApply_period1() {
		return apply_period1;
	}

	public void setApply_period1(String apply_period1) {
		this.apply_period1 = apply_period1;
	}

	public String getApply_period2() {
		return apply_period2;
	}

	public void setApply_period2(String apply_period2) {
		this.apply_period2 = apply_period2;
	}

	public String getApply_price() {
		return apply_price;
	}

	public void setApply_price(String apply_price) {
		this.apply_price = apply_price;
	}

	public int getVolunteer_num() {
		return volunteer_num;
	}

	public void setVolunteer_num(int volunteer_num) {
		this.volunteer_num = volunteer_num;
	}

	public String getVolunteer_username() {
		return volunteer_username;
	}

	public void setVolunteer_username(String volunteer_username) {
		this.volunteer_username = volunteer_username;
	}

	public String getVolunteer_date() {
		return volunteer_date;
	}

	public void setVolunteer_date(String volunteer_date) {
		this.volunteer_date = volunteer_date;
	}

	public String getVolunteer_time() {
		return volunteer_time;
	}

	public void setVolunteer_time(String volunteer_time) {
		this.volunteer_time = volunteer_time;
	}

	public String getVolunteer_office() {
		return volunteer_office;
	}

	public void setVolunteer_office(String volunteer_office) {
		this.volunteer_office = volunteer_office;
	}

}
