package bit.data.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {

		//return "/main/layoutMain/layoutMain";
		return "/mypage/layoutMypage/change";
		//return "/manager/layoutManager/change";

	}

}
