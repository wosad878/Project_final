package com.kim.Project_final.util;

public class Pager {
	
	private int curPage;	//현재 페이지
	private int perPage;	//페이지당 아이템 수
	private int curBlock;	//현재 페이지 블록(perBlock이 5면 1-5블록이 curBlock1)
	private int perBlock;	//보여지는 블록의 갯수
	private int totalBlock;	//총 블록 수(curBlock의 갯수)
	private int startNum;	//첫번째 페이지의 번호 
	private int lastNum;	//마지막 페이지의 번호
	private int startRow;	//DB에서 불러온 리스트의 RowNum의 첫번째 숫자 지정(curPage의 아이템의 첫번째 숫자가 됨)
	private int lastRow;	//DB에서 불러온 리스트의 RowNum의 마지막 숫자 지정(curPage의 아이템의 마지막 숫자가 됨)
	private int totalPage;
	private String category1;
	private String category2;
	private int orderBy;
	
	private String search;
	
	public Pager() {
		this.perPage=20;
		this.perBlock=5;
	}
	
	public void makeRow() {
		this.startRow = (getCurPage()-1)*getPerPage()+1;
		this.lastRow = getCurPage() * getPerPage();
	}
	
	public void makePage(int totalCount) {
		this.totalPage = totalCount/perPage;
		if(totalCount % perPage != 0) {
			totalPage ++;
		}
		
		this.totalBlock = totalPage/perBlock;
		if(totalPage % perBlock != 0) {
			this.totalBlock ++;
		}
		
		this.curBlock = curPage/perBlock;
		
		if(curPage%perBlock != 0) {
			curBlock ++;
		}
		this.startNum=(curBlock-1)*perBlock+1;
		this.lastNum=curBlock*perBlock;
		
		if(curBlock == totalBlock) {
			this.lastNum=totalPage;
		}
	}
	
	public String getCategory1() {
		if(category1 == null) {
			category1 = "1";
		}
		return category1;
	}
	
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	
	public String getCategory2() {
		if(category2 == null) {
			category2 = "";
		}
		return category2;
	}
	
	public void setCategory2(String categoty2) {
		this.category2 = categoty2;
	}
	public int getCurPage() {
		if(curPage == 0) {
			curPage = 1;
		}
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		if(perPage == 0) {
			perPage = 10;
		}
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getCurBlock() {
		
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	public String getSearch() {
		if(search == null) {
			search ="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}
	
}
