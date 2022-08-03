package com.sdsd.mvc.common.util;

public class ContentInfo {
	private int currentContent;
	
	public ContentInfo(int currentContent) {
		this.currentContent = currentContent;
	}
	public int getCurrentContent() {
		return this.currentContent;
	}
	
	public int getPrevContent() {
		int prevContent = this.getCurrentContent() - 1;
		
		return prevContent < 1 ? 1 : prevContent;
	}
	
	public int getNextContent() {
		int nextContent = this.getCurrentContent() + 1;
		
		return nextContent > 1000 ? 1000 : nextContent;
	}
	
	
	
	
	
}
