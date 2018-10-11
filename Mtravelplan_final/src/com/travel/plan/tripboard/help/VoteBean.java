package com.travel.plan.tripboard.help;
//com.travel.plan.tripboard.help.VoteBean
public class VoteBean {

	private int acount;
	private int total;
	
	public void setAcount(int acount) {
		this.acount = acount;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public  int barWidth(int acount, int total){
		if(total==0){
			return 0;
		}else{
			return (int)(1.0*acount/total*250);
		}
	}
	public  String barRatio(int acount, int total){
		if(total==0){
			return String.format("0 (%d%%)", 0);
		}else{
			//String.format -> %%�� %���
			//.2 �Ҽ��� 2�ڸ�
			return String.format("%d (%.2f%%)", 
					acount,(1.0*acount/total*100));
		}
	}
	public  String getMakeBar(){
		//�׸��� width�� ������Ѽ� ����׷����� �����.
		String t="<img src='./image/rd.gif' width='%dpx' height='21px'/> %s";
		String s=String.format(t,
				barWidth(acount, total), barRatio(acount, total));
		return s;
	}
}
