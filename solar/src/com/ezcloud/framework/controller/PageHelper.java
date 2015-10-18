package com.ezcloud.framework.controller;

import java.util.ArrayList;
import java.util.List;

/**
 * 页面上展示分页标签的帮助类
 * 
 * @ClassName: PageHelper
 * @author ez-cloud work group
 * @date 2014-7-17 下午06:09:01
 */
public class PageHelper {
	public int pageNumber;
	public int totalPages;
	public int segmentCount;
	public boolean has_previous;
	public boolean has_next;
	public boolean is_first;
	public boolean is_last;
	public int previousPageNumber;
	public int nextPageNumber;
	public int firstPageNumber;
	public int lastPageNumber;
	public List<Integer> segment;

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getSegmentCount() {
		return segmentCount;
	}

	public void setSegmentCount(int segmentCount) {
		this.segmentCount = segmentCount;
	}

	public boolean isHas_previous() {
		return has_previous;
	}

	public void setHas_previous(boolean hasPrevious) {
		has_previous = hasPrevious;
	}

	public boolean isHas_next() {
		return has_next;
	}

	public void setHas_next(boolean hasNext) {
		has_next = hasNext;
	}

	public boolean isIs_first() {
		return is_first;
	}

	public void setIs_first(boolean isFirst) {
		is_first = isFirst;
	}

	public boolean isIs_last() {
		return is_last;
	}

	public void setIs_last(boolean isLast) {
		is_last = isLast;
	}

	public int getPreviousPageNumber() {
		return previousPageNumber;
	}

	public void setPreviousPageNumber(int previousPageNumber) {
		this.previousPageNumber = previousPageNumber;
	}

	public int getNextPageNumber() {
		return nextPageNumber;
	}

	public void setNextPageNumber(int nextPageNumber) {
		this.nextPageNumber = nextPageNumber;
	}

	public int getFirstPageNumber() {
		return firstPageNumber;
	}

	public void setFirstPageNumber(int firstPageNumber) {
		this.firstPageNumber = firstPageNumber;
	}

	public int getLastPageNumber() {
		return lastPageNumber;
	}

	public void setLastPageNumber(int lastPageNumber) {
		this.lastPageNumber = lastPageNumber;
	}

	public List<Integer> getSegment() {
		return segment;
	}

	public void setSegment(List<Integer> segment) {
		this.segment = segment;
	}

	public void execute() {
		if (pageNumber < 1) {
			pageNumber = 1;
		}
		if (totalPages < 1) {
			totalPages = 1;
		}
		if (segmentCount < 1) {
			segmentCount = 5;
		}
		has_previous = pageNumber > 1;
		has_next = pageNumber < totalPages;
		is_first = pageNumber == 1;
		is_last = (pageNumber == totalPages);
		previousPageNumber = pageNumber - 1;
		nextPageNumber = pageNumber + 1;
		firstPageNumber = 1;
		lastPageNumber = totalPages;
		int startSegmentPageNumber = pageNumber - (int) Math.floor((segmentCount - 1) / 2D);
		int endSegmentPageNumber = pageNumber + (int) Math.ceil((segmentCount - 1) / 2D);
		if (startSegmentPageNumber < 1) {
			startSegmentPageNumber = 1;
		}
		if (endSegmentPageNumber > totalPages) {
			endSegmentPageNumber = totalPages;
		}
		segment = new ArrayList<Integer>();
		for (int i = startSegmentPageNumber; i <= endSegmentPageNumber; i++) {
			segment.add(i);
		}
	}
}