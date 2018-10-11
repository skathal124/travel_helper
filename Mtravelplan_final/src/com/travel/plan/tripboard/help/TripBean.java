package com.travel.plan.tripboard.help;

public class TripBean {

	private int depth=0;

	public String getReply() {
		String s="";
		String t="<img src='./image/re.gif' alt='´ä:' "
				 +" width='10px' height='10px'/>";
	    for(int i=0; i<depth; i++){
	    	s+="&nbsp;&nbsp;&nbsp;&nbsp;";
	    }
		return depth>0? s+t:"";
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
}
