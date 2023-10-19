package jyh.model;

public class memberDTO {
	private String email;
	private String pw;
	private int emailAuth;
	private String nickName;
	private String phoneNum;
	private String address;
	private int noshow;
	private int idAuth;
	//token id 
	private String nvrToken;
	private String kkoToken;
	/**
	 * 
	 */
	public memberDTO() {
		
	}
	
	/**
	 * @param email
	 * @param pw
	 * @param emailAuth
	 * @param nickName
	 * @param phoneNum
	 * @param address
	 * @param noshow
	 * @param idAuth
	 */
	//회원 조회 
	public memberDTO(String email, String pw, int emailAuth, String nickName, String phoneNum, String address,
			int noshow, int idAuth) {
		super();
		this.email = email;
		this.pw = pw;
		this.emailAuth = emailAuth;
		this.nickName = nickName;
		this.phoneNum = phoneNum;
		this.address = address;
		this.noshow = noshow;
		this.idAuth = idAuth;
	}
	//마이페이지 수정 
	

	// 회원가입 DTO 객체 // 회원정보수정객체 
	public memberDTO(String email, String pw, String nickName,String phoneNum,String address) {
		this.email = email;
		this.pw = pw;
		this.nickName = nickName;
		this.phoneNum = phoneNum;
		this.address = address;
	}
	/**
	 * @param email
	 * @param nickName
	 * @param phoneNum
	 * @param address
	 */
	// 세션 객체
	public memberDTO(String email,String nickName,int noshow) {
		this.email = email;
		this.nickName = nickName;
		this.noshow = noshow;
	}
	
	/**
	 * @param email
	 * @param nickName
	 * @param idAuth
	 */
	//sns 등록 
	public memberDTO(String email, String nickName) {
		super();
		this.email = email;
		this.nickName = nickName;
		
	}
	
	public String getEmail() {
		return email;
	}
	public String getPw() {
		return pw;
	}
	public int getEmailAuth() {
		return emailAuth;
	}
	public String getNickName() {
		return nickName;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public int getNoshow() {
		return noshow;
	}
	public int getIdAuth() {
		return idAuth;
	}
	public String getNvrToken() {
		return nvrToken;
	}
	public String getKkoToken() {
		return kkoToken;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setEmailAuth(int emailAuth) {
		this.emailAuth = emailAuth;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setNoshow(int noshow) {
		this.noshow = noshow;
	}
	public void setIdAuth(int idAuth) {
		this.idAuth = idAuth;
	}
	public void setNvrToken(String nvrToken) {
		this.nvrToken = nvrToken;
	}
	public void setKkoToken(String kkoToken) {
		this.kkoToken = kkoToken;
	}
	
	
	
}
