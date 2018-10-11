package com.travel.plan.tripboard.help;
import java.sql.Date;
import java.util.Calendar;
//<%=%>일때만 사용하고  JSTL과 함께 사용할 때는 static을 제거하고 get을 붙여
//useBean을 사용하자.
public class DateUtil {
	public static String toOne(String msg){
		return msg.charAt(0)=='0'?msg.charAt(1)+"":msg.trim();
	}
	//2012-08-07 문자열을 java.sql.Date로 바꾸기
	public static Date toDate(int year, int month, int day){
		String s = year + "-" + two(month+"") + "-" + two(day+"");
		Date d = Date.valueOf(s);
		return d;
	}
	public static String two(String msg){
		return msg.trim().length()<2?"0"+msg:msg.trim();
	}//
	public static String str(String msg){ //데크르라레이션에서 있던 메소드를 다 빼놨음
		return msg==null ?"":msg.trim();
	}//
	//완성하시오.
	public static String pollState(java.util.Date d){
		String s1="<div style='color:RED'>[종료]</div>";
		String s2="<div style='color:BLUE'>[진행중]</div>";
		return isEnd(d)?s1:s2;
	}
	//연월일만으로 대소 비교
	public static boolean isEnd(java.util.Date d){
		Calendar c=Calendar.getInstance();
		c.setTime(d);
		Calendar t=Calendar.getInstance();
		//오늘이 마지막날 보다 큰가?
		return Integer.parseInt(StringCal(t))>Integer.parseInt(StringCal(c));
	}
	//칼렌더를 20120807형식으로 만들기
	public static String StringCal(Calendar dd){
		String s=dd.get(Calendar.YEAR)+""+
		two((dd.get(Calendar.MONTH)+1)+"")+""+
		two(dd.get(Calendar.DATE)+"");
		return s;
	}
	public static int barWidth(int acount, int total){
		if(total==0){
			return 0;
		}else{
			return (int)(1.0*acount/total*400);
		}
	}
	public static String barRatio(int acount, int total){
		if(total==0){
			return String.format("0 (%d%%)", 0);
		}else{
			//String.format -> %%가 %출력
			//.2 소수점 2자리
			return String.format("%d (%.2f%%)", 
					acount,(1.0*acount/total*100));
		}
	}
	public static String makeBar(int acount, int total){
		//그림의 width를 변경시켜서 막대그래프를 만든다.
		String t="<img src='../image/rd.gif' width='%dpx' height='21px'/>%s";
		String s=String.format(t,
				barWidth(acount, total), barRatio(acount, total));
		return s;
	}
}