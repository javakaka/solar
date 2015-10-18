<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}" />
<input type="hidden" id="searchProperty" name="searchProperty" value="${page.searchProperty}" />
<input type="hidden" id="orderProperty" name="orderProperty" value="${page.orderProperty}" />
<input type="hidden" id="orderDirection" name="orderDirection" value="${page.orderDirection}" />
<c:set var="totalPages" value="${page.totalPages}"></c:set>
<c:set var="pageVariables" value="${page.pageHelper}"></c:set>
<c:if test="${totalPages >1 }">
<div class="pagination">
		<c:choose>
			<c:when test="${pageVariables.is_first}">
				<span class="firstPage">&nbsp;</span>
			</c:when>
			<c:otherwise>
				<a class="firstPage" href="javascript: $.pageSkip(${pageVariables.firstPageNumber});">&nbsp;</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pageVariables.has_previous}">
				<a class="previousPage" href="javascript: $.pageSkip(${pageVariables.previousPageNumber});">&nbsp;</a>
			</c:when>
			<c:otherwise>
				<span class="previousPage">&nbsp;</span>
			</c:otherwise>
		</c:choose>
		<c:forEach items="${pageVariables.segment}" var="segment" varStatus="status">
			<c:if test="${status.index == 0 && segment>(pageVariables.firstPageNumber + 1)}">
				<span class="pageBreak">...</span>
			</c:if>
			<c:choose>
				<c:when test="${segment != pageVariables.pageNumber}">
					<a href="javascript: $.pageSkip(${segment});">${segment}</a>
				</c:when>
				<c:otherwise>
					<span class="currentPage">${segment}</span>
				</c:otherwise>
			</c:choose>
			<c:if test="${status.last && segment<(pageVariables.lastPageNumber - 1)}">
				<span class="pageBreak">...</span>
			</c:if>
		</c:forEach>
		<c:choose>
			<c:when test="${pageVariables.has_next}">
				<a class="nextPage" href="javascript: $.pageSkip(${pageVariables.nextPageNumber});">&nbsp;</a>
			</c:when>
			<c:otherwise>
				<span class="nextPage">&nbsp;</span>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pageVariables.is_last}">
				<span class="lastPage">&nbsp;</span>
			</c:when>
			<c:otherwise>
				<a class="lastPage" href="javascript: $.pageSkip(${pageVariables.lastPageNumber});">&nbsp;</a>
			</c:otherwise>
		</c:choose>
		<span class="pageSkip">
			 <cc:message key="page.total" args="${pageVariables.totalPages}"/> <input id="pageNumber" name="pageNumber" value="${pageVariables.pageNumber}" maxlength="9" onpaste="return false;" />
			 <button type="submit">&nbsp;</button>
		</span>
	</div>
</c:if>