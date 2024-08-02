package com.example.demo.serviceImpl;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.SHA256;
import com.example.demo.mapper.LoginMapper;
import com.example.demo.service.LoginService;
import com.example.demo.vo.MemberVO;


@Service
public class LoginServiceImpl implements LoginService {
	/*
	 * @Value("${spring.mail.username}") private String fromEmail;
	 */
	
	@Autowired
	private LoginMapper loginMapper;
	
	/*
	 * @Autowired JavaMailSender javaMailSender;
	 * 
	 * @Autowired private SimpleMailMessage simpleMailMessage;
	 */

	@Override
	public int getLoginCheck(MemberVO memberVO) {
		SHA256 sha256 = new SHA256();
		
		String lawPw = memberVO.getPw();
		
		try {
			String cryptogram = sha256.encrypt(lawPw);
			memberVO.setPw(cryptogram);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = loginMapper.getLoginCheck(memberVO);
		return result;
	}
	
	@Override
	public String findId(MemberVO memberVO) {
		
		String result = loginMapper.findId(memberVO);
		
		return result;
		
	}
	
	@Override
	public int findUser(MemberVO memberVO) {
		int result = loginMapper.findUser(memberVO);
		
		return result;
	}
	
	@Override
	public int passUdt(MemberVO memberVO) {
		
		SHA256 sha256 = new SHA256();
		
		String lawPw = memberVO.getPw();
		
		try {
			String cryptogram = sha256.encrypt(lawPw);
			memberVO.setPw(cryptogram);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = loginMapper.passUdt(memberVO);
		
		return result;
	}
	
	/*
	 * @Override public String sendVerificationEmail(MemberVO memberVO) throws
	 * Exception {
	 * 
	 * simpleMailMessage.setFrom(fromEmail);
	 * simpleMailMessage.setTo(memberVO.getEmail());
	 * simpleMailMessage.setSubject("비밀번호 수정을 위한 인증번호입니다.");
	 * 
	 * 
	 * String verificationCode = generateVerificationCode();
	 * simpleMailMessage.setText("인증 코드: " + verificationCode);
	 * 
	 * javaMailSender.send(simpleMailMessage); System.out.println("메일 보내짐"); return
	 * verificationCode;
	 * 
	 * } private String generateVerificationCode() { // 이메일 인증 코드 생성 로직 구현 // 예:
	 * UUID 사용 또는 랜덤한 문자열 생성
	 * 
	 * // UUID를 사용하여 인증 코드 생성 String verificationCode =
	 * UUID.randomUUID().toString().replace("-", "");
	 * 
	 * // 또는 랜덤한 문자열을 생성하여 인증 코드로 사용할 수도 있습니다. // String verificationCode =
	 * generateRandomString(10);
	 * 
	 * return verificationCode; }
	 */
	 
}
