package naver.cloud;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration//빈등록
@PropertySource("classpath:/naver.properties")//가져올 프로퍼티 파일
@ConfigurationProperties(prefix="ncp")//프로퍼티 파일에서 선언된 값 중에서 ncp 이름으로 시작하는 값들 가져오기
@Data
public class NaverConfig {
    //프로퍼티 파일에서 선언된 값 중에서
    //ncp.* 이름으로 된 프로퍼티 값을 받을 필드 선언
    private String accessKey;//ncp.accessKey 를 받을 변수
    private String secretKey;//ncp.secretKey 를 받을 변수
    private String regionName;//ncp.regionName 를 받을 변수
    private String endPoint;//ncp.endPoint 를 받을 변수
}