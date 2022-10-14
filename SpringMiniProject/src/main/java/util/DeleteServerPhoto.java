package util;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class DeleteServerPhoto {

    //톰캣 서버에 저장된 사진 파일 지우기
    //(실제 파일부터 지우고 DB에서 파일명을 삭제해야 함. 파일명부터 삭제하면 파일을 찾을 수 없음)
    public static void deleteServerPhoto(String path, String fileName){
        File file = new File(path + "/" + fileName);
        System.out.println("delete photo method");
        if (file.exists()){
            System.out.println("delete photo if");
            file.delete();
        }
    }
}
