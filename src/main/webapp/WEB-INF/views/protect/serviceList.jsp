<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="listCount" value="${ requestScope.totalCount }" />
<c:set var="startPage"  value="${ requestScope.startPage }"/>
<c:set var="endPage"  value="${ requestScope.endPage }"/>
<c:set var="maxPage"  value="${ requestScope.maxPage }"/>
<c:set var="currentPage"  value="${ requestScope.currentPage }"/>
<!DOCTYPE html>
<html lang="ko">
	<head>
        <c:import url="/WEB-INF/views/include/head.jsp"/>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div id="wrap">
            <c:import url="/WEB-INF/views/include/header.jsp"/>
			<!-- 컨텐츠 -->
			<div id="content">
			    <!--서브 비주얼/타이틀-->
                <div class="visual-sub-vagas animal-vagas">
                    <div class="vsv-copy sub-title">
                       <div>
                            <ul class="navi">
                                <li><a href="main.do">홈</a></li>
                                <li class="xi-angle-right"><a href="vlist.do">자원봉사모집</a></li>
                            </ul>
                        </div>
                        <h2><span>자원봉사모집</span></h2>
                        <h3>작은 천사들을 위해 도와주실<br/>자원봉사자 여러분을 모집하고 있습니다.</h3>
                    </div>
                </div>
                <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->
<script type="text/javascript">
//검색 분류 선택 확인
$(function(){
   $("[name='sel']").on("click", function(){
      if($("select[name='type'] option:selected").val().length == 0) {
         alert("분류를 선택해주세요");
         return false;
      }
   });
});
</script>
                    <div class="subContent">
                        <!--서브 검색-->       
                         <!-- searchFiled 로 구분하고 값은 searchValue 로 받음 -->    
                       <form action="vlist.do" name="">     
                        <div class="search_wrap" id="search">
                           <%-- <input type="hidden" name="volche" value="${ volche }"> --%> 
                            <select name="searchFiled" id="searchS">
                                <option value="voltitle" class="fontColor-dark" ${pageVO.searchFiled eq"voltitle"?"selected":""}>제목</option>
                                <option value="voladdress" class="fontColor-dark" ${pageVO.searchFiled eq"voladdress"?"selected":""}>지역</option>
                                <option value="volname" class="fontColor-dark"${pageVO.searchFiled eq"volname"?"selected":""}>센터명</option>
                            </select>
                            <div class="search-box">
                                <input type="text" id="searchI" name="searchValue" placeholder="원하시는 키워드를 검색해주세요." value ="${ pageVO.searchValue }">
                                 <button type="submit" name="sel" value="SEARCH"  class="xi-search"></button>
                            </div>
                           </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 ${requestScope.totalCount}개</h4>
                            <div>
                            <c:if test="${ !empty sessionScope.loginMember}">
                                <a href="vWriteFormView.do" class="writeBtn">글쓰기</a>
                            </c:if>    
                                <div>
                                <c:url var = "volC" value= "vlist.do">
                                 	<c:param name="searchFiled" value="${pageVO.searchFiled }" />
									<c:param name="searchValue" value="${pageVO.searchValue }" />
								</c:url>
                                <form action="vlist.do" name="">
                                    <a ${ volche eq "y"?'class="active"' : "" }href="${volC}&volche=y">모집중</a>
                                    <a ${ volche eq "n"?'class="active"' : "" }href="${volC}&volche=n">모집완료</a>
                                    <a ${ empty volche ?'class="active"' : "" }href="${volC}">전체</a>
                                </form>
                                </div>
                            </div>
                        </div>
                        
                         <!-- 게시물이 0개라면 경고창을 띄우고 전 페이지로 이동 -->
                        <c:if test="${ totalCount == 0}">
                       <script>alert('검색결과에 해당하는 게시물이 없습니다.');
                       	history.go(-1);</script>
                        </c:if>
                        <!--리스트-->
                            <table class="servicelList">
                                <colgroup>
                                    <col width="20%">
                                    <col width="*">
                                    <col width="20%">
                                </colgroup>
                                <tbody>
                                  <c:forEach var="v" items="${requestScope.Vlist}">
                                  		<c:url var="vd" value="vdetail.do">
                                  	 		<c:param name="volno" value="${ v.volno}"/>
                                  	 		<c:param name="pageNo" value="${ pageVO.pageNo }"/>
                                 			<c:param name="searchFiled" value="${pageVO.searchFiled }" />
											<c:param name="searchValue" value="${pageVO.searchValue }" />
											<c:param name="volche" value="${ v.volche }"/>
											<c:param name="volwriter" value="${ v.volwriter }"/>
                                  		</c:url>
                                  		<c:if test="${ v.volche eq 'y' }">
                                    <tr class="serviceOn" onclick="location.href='${vd}'">
                                    	</c:if>
                                    	<c:if test="${ v.volche eq 'n' }">
                                    <tr class="serviceOut" onclick="location.href='${vd}'">
                                        </c:if>
                                        <td class="img">
                                           <c:if test="${ v.volche eq 'y' }">  
                                              <span>모집중</span>
                                           </c:if>
                                           <c:if test="${ v.volche eq 'n' }">
                                          	  <span>마감</span>
                                           </c:if>
                                           <c:if test="${ empty v.volre1 }">
                                            <img src="/runningdog/resources/images/common/noImage02.png" style="border:2px solid #ff92a8;">
                                           </c:if>
                                           <c:if test="${ !empty v.volre1 }">
                                            <img src="/runningdog/resources/vfiles/${v.volre1 }">
                                           </c:if>
                                        </td>
                                        <td>
                                            <h3>${ v.voltitle }</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>${v.voladdress}</li>
                                                <li><span>센터명 : </span>${v.volname}</li>
                                                 <li><span>모집기간 :</span> 상시모집 /
                                                	<c:if test="${ v.volche eq 'y'}">
                                                			모집중</li>
                                               		</c:if>
                                               		<c:if test="${ v.volche eq 'n'}">
                                               				모집완료</li>
                                               		</c:if>
                                               		<c:if test="${!empty v.volterm1 }">
                                                <li><span>봉사기간 : </span>${v.volterm1}~${v.volterm2}</li>
                                                    </c:if>
                                            </ul>
                                        </td>
                                        <td><a href="${vd}">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                   </c:forEach>
                                 
                                </tbody>
                            </table>
                        <!-- 리스트 끝 -->
                    
                        <!-- 페이징 -->
                      <c:if test="${totalCount > 0}">
                        <dl class="list-paging">
                            <dd>
								<c:if test="${pageVO.pageNo >0 }">
									<c:if test="${pageVO.startPageNo >5 }">
										<c:url var = "dl1" value="vlist.do">
											<c:param name="pageNo" value="${ pageVO.startPageNo-5 }"/>
											<c:param name="searchFiled" value="${pageVO.searchFiled }"/>
											<c:param name="searchValue" value="${pageVO.searchValue }"/>
											<c:param name="volche" value="${ volunteer.volche }"/>
										</c:url>
										<a href="${dl1 }"><i class="xi-angle-left"></i></a>
									</c:if>
									<c:forEach var="i" begin="${pageVO.startPageNo}"
										end="${ pageVO.endPageNo }" step="1">
										<c:url var = "dl2" value="vlist.do">
												<c:param name="pageNo" value="${ i }"/>
												<c:param name="searchFiled" value="${pageVO.searchFiled }"/>
												<c:param name="searchValue" value="${pageVO.searchValue }"/>
												<c:param name="volche" value="${ volunteer.volche }"/>
											</c:url>
										<c:choose>
											<c:when test="${i eq pageVO.pageNo }">
											
												<a href="${dl2}" class="active">${ i }</a>
											</c:when>
											<c:otherwise>
												<a href="${dl2}" class="">${ i }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pageVO.pageNo != pageVO.finalPageNo and pageVO.finalPageNo > 5}">
										<c:url var = "dl3" value= "vlist.do">
											<c:param name="pageNo" value="${ pageVO.endPageNo +1 }"/>
											<c:param name="searchFiled" value="${pageVO.searchFiled }"/>
											<c:param name="searchValue" value="${pageVO.searchValue }"/>
											<c:param name="volche" value="${ volunteer.volche }"/>
										</c:url>
										<a href="${dl3 }"><i
											class="xi-angle-right"></i></a>
									</c:if>
								</c:if>
							</dd>
                        </dl>
                      </c:if>
                      <c:if test="${ listCount eq 0}">
                        <tr class="list-no">
							<td colspan="7">
								<p><img src="/runningdog/resources/images/btnIcn/icn_big_listNo.png" alt="" title="" /></p>
								<h1>목록이 없습니다.</h1>
							</td>
						</tr>
                    </c:if>
                        <!-- //페이징 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>