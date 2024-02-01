package kr.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import kr.spring.interceptor.LoginCheckInterceptor;
import kr.spring.websocket.SocketHandler;

@Configuration
@EnableWebSocket
public class Appconfig implements WebMvcConfigurer, WebSocketConfigurer {
	
	/*---------------------------로그인 interceptor----------------------------*/
	private LoginCheckInterceptor loginCheck;
	
	@Bean
	public LoginCheckInterceptor interceptor() { //인터셉터 객체 생성
		loginCheck = new LoginCheckInterceptor();
		return loginCheck; 
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) { //인터셉터 등록
		
		registry.addInterceptor(loginCheck)
			.addPathPatterns("/member/mypageMain")
			.addPathPatterns("/member/mypageUpdate")
			.addPathPatterns("/book/write")
			.addPathPatterns("/secondhand/write")
			.addPathPatterns("/book/update")
			.addPathPatterns("/performance/updateTicketing")
			.addPathPatterns("/book/cancel");
	}
	
	
	/*---------------------------Tiles 사용 설정----------------------------*/
	@Bean
	public TilesConfigurer tiesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		
		//tilesdef.xml의 경로와 파일명 지정
		configurer.setDefinitions(new String[] { //여러 개 넘겨주기 위해 배열 이용
					"/WEB-INF/tiles-def/de.xml",
					"/WEB-INF/tiles-def/hyun.xml",
					"/WEB-INF/tiles-def/jiwon.xml",
					"/WEB-INF/tiles-def/jy.xml",
					"/WEB-INF/tiles-def/na.xml",
					"/WEB-INF/tiles-def/yeeun.xml"
					}); 
		
		configurer.setCheckRefresh(true);
		
		return configurer;
	} 
	
	@Bean
	public TilesViewResolver tilesViewResolver() {
		
		final TilesViewResolver tilesViewResolver = new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		
		return tilesViewResolver;
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new SocketHandler(), "message-ws").setAllowedOrigins("*");
	}
	
	
}