//package bit.data.controller;
//
//import bit.data.dto.QnaDto;
//import bit.data.service.QnaServiceInter;
//import util.ChangeName;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//public class QnaController {
//
//    @Autowired
//    QnaServiceInter qnaService;
//	@GetMapping("/qna/qnaList")
//	public String board(@RequestParam(defaultValue = "1") int currentPage, //null�� ��� �⺻�������� 1
//						@RequestParam(value = "searchcolumn", required = false) String sc, //required = false : ���� ���� ��� null
//						@RequestParam(value = "searchword", required = false) String sw,
//						Model model) {
//		//����¡ ó���� �ʿ��� ������
//		//��ü ����
//		int totalCount = qnaService.getTotalCount(sc, sw);
//		int perPage=10;//���������� ������ ���� ����
//		int perBlock=5;//�Ѻ��� ������ �������� ����
//		int startNum;//db���� ������ ���� ���۹�ȣ(mysql�� ù���� 0��,����Ŭ�� 1��)
//		int startPage;//������ ������ ����������
//		int endPage;//�� ���� ������ ��������
//		int totalPage;//�� ��������
//		int no;//�� �������� ����� ���۹�ȣ
//
//		//�� ���������� ���Ѵ�
//		//�ѱ��ǰ���/���������纸���������� ����(7/5=1)
//		//�������� 1�̶� ������ ������ 1������ �߰�(1+1=2�������� �ʿ�)
//		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
//
//		//�� ���� ������ ����������
//		//perBlock=5 �ϰ�� ������������ 1~5 �ϰ��� ������������ 1, ���������� 5
//		//���� ������������ 13 �ϰ��� ������������ 11, ���������� 15
//		startPage=(currentPage-1)/perBlock*perBlock+1;
//		endPage=startPage+perBlock-1;
//		//������������ 23���ϰ�� ������ ���� ���������� 25�� �ƴ϶� 23�̶���Ѵ�
//		if(endPage>totalPage)
//			endPage=totalPage;
//
//		//�� ���������� ������ ���۹�ȣ
//		//��: 1������->0, 2������:5, 3������ : 10...
//		startNum=(currentPage-1)*perPage;
//
//		//���������� ����� ���۹�ȣ ���ϱ�
//		//��: �ѱ۰����� 23�̶��  1�������� 23,2�������� 18,3�������� 13...
//		no=totalCount-(currentPage-1)*perPage;
//
//		//���������� ������ �۸� ��������
//		List<QnaDto> list = qnaService.getPagingList(sc, sw, startNum, perPage);
//
//
//		//request�� ��� �� �ʿ��� �������� �־��ش�
//		model.addAttribute("list",list);
//		model.addAttribute("totalCount", totalCount);
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("startPage", startPage);
//		model.addAttribute("endPage", endPage);
//		model.addAttribute("no", no);
//		model.addAttribute("totalPage", totalPage);
//
//		System.out.println("totalCount="+totalCount);
//		return "/bit/board/boardlist";
//	}
//
//
//	@GetMapping("/qna/qnaform")
//	public String bform(@RequestParam(defaultValue = "0") int qnanum,
//						@RequestParam(defaultValue = "0") int regroup,
//						@RequestParam(defaultValue = "0") int restep,
//						@RequestParam(defaultValue = "0") int relevel,
//						@RequestParam(defaultValue = "1") int currentPage,
//						Model model) {
//		//����� ��츸 �Ѿ���� ����
//		//�� ���� ���� ��� null �̹Ƿ� defaultValue ������ ����
//		model.addAttribute("qnanum", qnanum);
//		model.addAttribute("regroup", regroup);
//		model.addAttribute("restep", restep);
//		model.addAttribute("relevel", relevel);
//		model.addAttribute("currentPage", currentPage);
//
//		//���� �� ���� ��� "", ����� ��� �ش� ������ �־��
//		String subject = "";
//		if(qnanum>0) {
//			subject = qnaService.getData(qnanum).getSubject();
//		}
//		model.addAttribute("subject", subject);
//
//		return "/bit/board/boardform";
//	}
//
//	@PostMapping("/qna/insert")
//	public String insert(QnaDto dto, int currentPage, List<MultipartFile> upload, HttpServletRequest request) {
//
//		//���ε� ���
//		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//		System.out.println(path);
//
//		//���ε带 ������ ��� 0������ ���ϸ��� ""�� �ȴ�
//		//���ε� ���ص� upload size�� 1�� �ȴ�
//		System.out.println(upload.size());
//
//		if(upload.get(0).getOriginalFilename().equals("")) {
//			dto.setPhoto("no");
//		} else {
//			String photo = "";
//			int idx = 0;
//			for(MultipartFile multi:upload) {
//				//���ϸ��� ���� ��¥�� ���� �� ,�� ����
//				String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
//				photo += newName + ",";
//
//				//���ε�
//				try {
//					multi.transferTo(new File(path + "/" + newName));
//				} catch (IllegalStateException | IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//			//������ �ĸ� ����
//			photo = photo.substring(0, photo.length()-1);
//			//dto�� ����
//			dto.setPhoto(photo);
//		}
//
//		//db�� insert
//		qnaService.insertBoard(dto);
//
//		return "redirect:list?currentPage=" + currentPage;
//	}
//
//	@GetMapping("/board/detail")
//	public ModelAndView detail(int num, int currentPage) {
//		ModelAndView mview = new ModelAndView();
//		//��ȸ�� ����
//		qnaService.updateReadCount(num);
//		//num�� �ش��ϴ� dto ���
//		QnaDto dto = qnaService.getData(num);
//		//�۾� ����� ������ memphoto
//		//�� �� �۾� ����� Ż������ ��� �������� ������ �߻�
//		String memphoto="";
//		try {
//		} catch(NullPointerException e) {
//			memphoto = "no";
//			dto.setUsername("Ż���� ȸ��");
//		}
//
//		mview.addObject("dto", dto);
//		mview.addObject("memphoto", memphoto);
//		mview.addObject("currentPage", currentPage);
//
//		mview.setViewName("/bit/board/boarddetail");
//		return mview;
//	}
//
//
//
//	@GetMapping("/board/delete")
//	public String delete(int qnanum, int currentPage) {
//		qnaService.deleteBoard(qnanum);
//		//���� �� ���� �������� �̵�
//		return "redirect:list?currentPage="+currentPage;
//	}
//
//	@PostMapping("/board/update")
//	public String update(QnaDto dto, int currentPage, List<MultipartFile> upload, HttpServletRequest request) {
//
//		//���ε� ���
//		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//		System.out.println(path);
//
//		//���ε带 ������ ��� 0������ ���ϸ��� ""�� �ȴ�
//		//���ε� ���ص� upload size�� 1�� �ȴ�
//		System.out.println(upload.size());
//
//		if(upload.get(0).getOriginalFilename().equals("")) {
//			dto.setPhoto(null); //���� �������� ���� ���Ѵ�
//		} else {
//			String photo = "";
//			int idx = 0;
//			for(MultipartFile multi:upload) {
//				//���ϸ��� ���� ��¥�� ���� �� ,�� ����
//				String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
//				photo += newName + ",";
//
//				//���ε�
//				try {
//					multi.transferTo(new File(path + "/" + newName));
//				} catch (IllegalStateException | IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//			//������ �ĸ� ����
//			photo = photo.substring(0, photo.length()-1);
//			//dto�� ����
//			dto.setPhoto(photo);
//		}
//
//		//db�� insert
//		qnaService.updateBoard(dto);
//
//		return "redirect:list?currentPage=" + currentPage + "&num=" + dto.getQnanum();
//	}
//
//	@GetMapping("/board/updateform")
//	public String updateform(Model model, int num, int currentPage) {
//		//num�� �ش��ϴ� dto ���
//		QnaDto dto = qnaService.getData(num);
//		//model�� ����
//		model.addAttribute("dto", dto);
//		model.addAttribute("currentPage", currentPage);
//
//		return "/bit/board/updateform";
//	}
//
//}
