package project.rahim;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {
    @GetMapping("/greetings")
    public String greetings(){
        return "Hello, this is greetings message!)";
    }
}
