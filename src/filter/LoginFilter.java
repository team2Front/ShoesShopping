package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        try {
//        	로그인 정보를 담고있는 session을 얻는다.
//        	null일시 session을 새로 생성하지 않기 위해 getSession메서드는 false로 설정합니다.
			HttpSession session = httpRequest.getSession(false);
			if (session == null || session.getAttribute("loginId") == null) {
				//로그인으로 리다이렉트
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/user/LoginSessionController");
				return; //  이 필터의 기능을 끝낸다.
			}
		
            chain.doFilter(request, response);

        } catch (Exception e) {
            throw e;
        } finally {
        }
    }

}