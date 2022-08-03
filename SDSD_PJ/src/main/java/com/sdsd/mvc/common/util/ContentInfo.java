package com.sdsd.mvc.common.util;

public class ContentInfo {
	private int currentContent;
	
	public ContentInfo(int currentContent) {
		this.currentContent = currentContent;
	}
	public int getCurrentPage() {
		return this.currentContent;
	}
	
	public int getPrevContent() {
		int prevContent = this.getCurrentPage() - 1;
		
		return prevContent < 1 ? 1 : prevContent;
	}
	
	public int getNextContent() {
		int nextContent = this.getCurrentPage() + 1;
		
		return nextContent > 1000 ? 1000 : nextContent;
	}
	
	
	
	
	
}
