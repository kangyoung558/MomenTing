package com.momtenting.domain;

import java.util.List;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev;
	private boolean next;
	
	private int total;
	private Criteria cri;
	private List<BoardVo> list;
	
	public PageDTO(Criteria cri, int total){
		this.cri = cri;
		this.total = total;
		
		endPage = (cri.getPageNum() + 9) / 10 * 10;
		startPage = endPage - 9;
		
		realEnd = (int) ((total +9) / 10);
		endPage = realEnd < endPage ? realEnd : endPage;
		
		
		prev = startPage > 1;
		next = endPage < realEnd;
	}
	
	public PageDTO(Criteria cri, int total, List<BoardVo> list) {
		this.cri = cri;
		this.total = total;
		
		endPage = (cri.getPageNum() + 9) / 10 * 10;
		startPage = endPage - 9;
		
		realEnd = (int) ((total +9) / 10);
		endPage = realEnd < endPage ? realEnd : endPage;
		
		
		prev = startPage > 1;
		next = endPage < realEnd;
		
		this.list = list;
	}
	
}
