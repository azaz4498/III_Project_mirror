<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  
  	<c:set var ="size" value= "${fn:length(hoteldata)}"></c:set>
		<c:if test = "${size < 1}" >
			<h5>查無資料</h5>
			
		<script>
		$("#page").children().remove();
		</script>
		</c:if>
		<c:if test = "${size > 0}" >
<c:forEach var="hotels" items="${hoteldata}">
            <tr>
				<td id="SN">${hotels.SN}</td>
                <td>${hotels.NAME}</td>
                <td>${hotels.REGION}</td>
                <td>${hotels.ADDRESS}</td>
                <td>${hotels.TYPE}</td>
<%-- 開關(綠色) --%><td id="STATUS"><label class="switch switch-text switch-success switch-pill form-control-label">
                	<c:choose>
                	  <c:when test="${hotels.STATUS eq '啟用'}">
	      				<input type="checkbox" name="status" class="switch-input form-check-input" id="checkbox" value="啟用" checked >
	      				<span class="switch-label" data-on="啟用" data-off="禁用"></span>
	      				<span class="switch-handle"></span>
	      			  </c:when>
	      			  <c:otherwise>
	      				<input type="checkbox" name="status" class="switch-input form-check-input"  id="checkbox" value="禁用" >
	      				<span class="switch-label" data-on="啟用" data-off="禁用"></span>
	      				<span class="switch-handle"></span>
	      			  </c:otherwise>
	      			</c:choose>
	      			</label></td> <%-- 開關(綠色) --%> 
                <td><button type="button" class="btn btn-warning mb-2"  onclick="clickdetail('${hotels.SN}')">修改</button></td>
                <td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#Hotel${hotels.SN}" >刪除</button>
               
               		<div class="modal fade" id="Hotel${hotels.SN}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        			 <div class="modal-dialog modal-dialog-centered" role="document">
         			  <div class="modal-content">
         			    <div class="modal-header">
             			  <h5 class="modal-title" id="exampleModalCenterTitle">刪除提醒</h5>
             			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               				  <span aria-hidden="true">&times;</span>
              			  </button>
           			  	</div>
            		 <div class="modal-body">
                		<form action="hoteldelete" method="POST">
                		<input type="hidden" value="${hotels.SN}" name="deleteId">
                   		 <div class="form-group">
                    	  <h4>是否確認刪除  ${hotels.NAME} 住宿資料?</h4>
                    	 </div>
               			 <div class="modal-footer">
                 	 		<button type="submit" class="btn btn-primary">確認</button>
                  			<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
               			 </div>
                 	 	</form> 
            		 </div>
          		 </div>
       	  		</div>
      		 </div></td>
            </tr>
            </c:forEach>
            </c:if>
            <script type="text/javascript">
				currentPage = ${hpage.currentPage};
				totalPage = ${hpage.totalPageCount};
				$("#page-btn").text(currentPage+"/"+totalPage);

				if(currentPage == 1){
					$(".page-link.first").attr("disabled", true);
					$(".page-link.previous").attr("disabled", true);						
				}else{
					$(".page-link.first").attr("disabled", false);
					$(".page-link.previous").attr("disabled", false);
					}

				if(currentPage == totalPage){
					$(".page-link.last").attr("disabled", true);
					$(".page-link.next").attr("disabled", true);						
				}else{
					$(".page-link.last").attr("disabled", false);
					$(".page-link.next").attr("disabled", false);
					}
            </script>