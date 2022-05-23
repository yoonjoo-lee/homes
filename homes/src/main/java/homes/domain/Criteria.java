package homes.domain;

public class Criteria {

	
	private int page;	// 페이지
	private int perPageNum;	//화면에 리스트 출력개수
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 15;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 1) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum < 1 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	
}
