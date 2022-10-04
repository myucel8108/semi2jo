package util;

import java.util.Calendar;

public class ChangeName {
	
	public static String getChangeFileName(String fileName) {
		int dotLoc = fileName.indexOf('.');
		String fname = fileName.substring(0,dotLoc); //�뙆�씪紐� (媛��굹�떎�씪留덈컮�궗)
		String ext = fileName.substring(dotLoc); //�솗�옣�옄 (.jpg)
		
		//�궇吏쒕�� 援ы빐�꽌 �뿰�썡�씪�떆遺꾩큹 + 1000遺꾩쓽1珥�.jpg �씠�윴�떇�쑝濡� �뙆�씪紐� 蹂�寃쏀븯湲�
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		int hh = cal.get(Calendar.HOUR);
		int mm= cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.SECOND);
		int ms = cal.get(Calendar.MILLISECOND);
		
		//�닽�옄怨꾩궛�쓣 留됯린 �쐞�빐 留� �븵�� ""濡� 臾몄옄�뿴 泥섎━
		fileName = "" + y + (m<10?"0"+m:m) + (d<10?"0"+d:d) + (hh<10?"0"+hh:hh) + (mm<10?"0"+mm:mm) + (ss<10?"0"+ss:ss) + ms + ext;
		
		return fileName;
	}
}