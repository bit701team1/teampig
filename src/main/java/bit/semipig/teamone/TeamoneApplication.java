package bit.semipig.teamone;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"naver.cloud","boot.semipig.*"})
@MapperScan({"boot.semipig.Mapper"})
public class TeamoneApplication{

    public static void main(String[] args) {
        SpringApplication.run(TeamoneApplication.class, args);
    }

}
