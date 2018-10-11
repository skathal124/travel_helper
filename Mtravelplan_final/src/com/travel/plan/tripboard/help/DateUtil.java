package com.travel.plan.tripboard.help;
import java.sql.Date;
import java.util.Calendar;
//<%=%>�϶��� ����ϰ�  JSTL�� �Բ� ����� ���� static�� �����ϰ� get�� �ٿ�
//useBean�� �������.
public class DateUtil {
	public static String toOne(String msg){
		return msg.charAt(0)=='0'?msg.charAt(1)+"":msg.trim();
	}
	//2012-08-07 ���ڿ��� java.sql.Date�� �ٲٱ�
	public static Date toDate(int year, int month, int day){
		String s = year + "-" + two(month+"") + "-" + two(day+"");
		Date d = Date.valueOf(s);
		return d;
	}
	public static String two(String msg){
		return msg.trim().length()<2?"0"+msg:msg.trim();
	}//
	public static String str(String msg){ //��ũ�����̼ǿ��� �ִ� �޼ҵ带 �� ������
		return msg==null ?"":msg.trim();
	}//
	//�ϼ��Ͻÿ�.
	public static String pollState(java.util.Date d){
		String s1="<div style='color:RED'>[����]</div>";
		String s2="<div style='color:BLUE'>[������]</div>";
		return isEnd(d)?s1:s2;
	}
	//�����ϸ����� ��� ��
	public static boolean isEnd(java.util.Date d){
		Calendar c=Calendar.getInstance();
		c.setTime(d);
		Calendar t=Calendar.getInstance();
		//������ �������� ���� ū��?
		return Integer.parseInt(StringCal(t))>Integer.parseInt(StringCal(c));
	}
	//Į������ 20120807�������� �����
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
			//String.format -> %%�� %���
			//.2 �Ҽ��� 2�ڸ�
			return String.format("%d (%.2f%%)", 
					acount,(1.0*acount/total*100));
		}
	}
	public static String makeBar(int acount, int total){
		//�׸��� width�� ������Ѽ� ����׷����� �����.
		String t="<img src='../image/rd.gif' width='%dpx' height='21px'/>%s";
		String s=String.format(t,
				barWidth(acount, total), barRatio(acount, total));
		return s;
	}
}