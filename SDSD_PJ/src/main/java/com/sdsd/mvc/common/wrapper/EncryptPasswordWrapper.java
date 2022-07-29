package com.sdsd.mvc.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.sdsd.mvc.common.util.EncryptUtil;

public class EncryptPasswordWrapper extends HttpServletRequestWrapper {

	public EncryptPasswordWrapper(HttpServletRequest request) {
		super(request);
	}
	
	// HttpServletRequest에서 재 정의 하고 싶은 메소드를 작성한다.
	@Override
	public String getParameter(String name) {
		String value = "";
		
		// Client가 전달하는 값중에 userPwd 값만 암호화 처리하고 나머지는 정상적으로 반환하도록 구현
		if(name.equals("password") && super.getParameter("password").length() != 8 ) {
			// 암호화 처리 후 반환한다.
			System.out.println("암호화");
			value = EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
		} else if(name.equals("password2")) {
			value = EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
		} else {
			// 정상적으로 반환한다.
			value = super.getParameter(name);
		}
		
		return value;
	}

}
