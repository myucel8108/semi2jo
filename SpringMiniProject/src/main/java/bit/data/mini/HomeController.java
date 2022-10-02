package bit.data.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
		return "/manager/manager/addLectureForm";
	}
<<<<<<< HEAD
}
=======
		
		@GetMapping("/student/myCart")
		public String Cart() {
			return "/main/student/myCart";
		}
			
	
		
		
}
>>>>>>> origin/ldh
