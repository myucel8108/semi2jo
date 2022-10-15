package bit.data.mini;

import bit.data.dto.BoardDto;
import bit.data.dto.LectureDto;
import bit.data.dto.QnaDto;
import bit.data.service.LecDetailService;
import bit.data.service.QnaService;
import bit.data.service.QnaServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class HomeController {

	@Autowired
	LecDetailService lecDetailService;

	@GetMapping("/")
	public String home(Model model) {


		List<LectureDto> hotlectures = lecDetailService.selectHotLectures();
		model.addAttribute("hotlectures", hotlectures);

		return "/main/layoutMain/change";
	}
		
}
