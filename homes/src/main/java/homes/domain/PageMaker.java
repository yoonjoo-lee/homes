package homes.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10; // < 1 2 3 4 5 6 7 8 9 10 >
	private SearchCriteria scri;
	
	
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDispalyPageNum() {
		return displayPageNum;
	}
	public void setDispalyPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public void calcData() {
		endPage = (int)(Math.ceil(scri.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)scri.getPerPageNum()));
				
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage*scri.getPerPageNum() >= totalCount? false:true;
 		
	}
	public String encoding(String keyword) {
		String str = "";
		
		try {
			if (keyword != null) {
			
				str = URLEncoder.encode(keyword, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		return str;
	}
	
}
