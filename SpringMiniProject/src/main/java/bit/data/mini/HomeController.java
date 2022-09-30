package bit.data.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
		return "home";
=======
		return "/mypage/layoutMypage/change";
>>>>>>> origin/woojin
=======
		return "home";
>>>>>>> origin/taemin
=======
		return "/manager/layoutManager/change";
>>>>>>> origin/Joonmin
	}

}
