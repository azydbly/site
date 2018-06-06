package com.entity;

/**
 * @author yanp
 * 类描述： 分页显示
 * 2017-4-21 上午9:41:06
 */
public class Page {
	/**
	 * 页码
	 */
	private int pageNum;
	/**
	 * 每页显示的行数
	 */
	private int pageRows;
	/**
	 * 总行数
	 */
	private int totalRows;
	/**
	 * 总页数
	 */
	private int totalPages;
	/**
	 * 起始行号
	 */
	private int beginRownum;
	/**
	 * 结束行号
	 */
	private int endRownum;
	
	/**
	 * 总条数
	 */
	private int totalCount;

	public Page(int pageNum, int pageRows, int totalRows) {
		this.pageNum = pageNum;
		this.pageRows = pageRows;
		this.totalRows = totalRows;
		// 计算总页数:总行数%每页行数==0?总行数/每页行数:总行数/每页行数+1
		this.totalPages = totalRows % pageRows == 0 ? totalRows / pageRows : (totalRows / pageRows) + 1;
		beginRownum = (pageNum - 1) * pageRows;
		endRownum = pageNum * pageRows;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageRows() {
		return pageRows;
	}

	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getBeginRownum() {
		return beginRownum;
	}

	public void setBeginRownum(int beginRownum) {
		this.beginRownum = beginRownum;
	}

	public int getEndRownum() {
		return endRownum;
	}

	public void setEndRownum(int endRownum) {
		this.endRownum = endRownum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
