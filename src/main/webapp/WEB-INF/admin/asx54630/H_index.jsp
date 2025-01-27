<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>FUN x TAIWAN</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">



</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
 <%----------------------------------------以下為個人內容-------------------------------%>
		<div class="content-wrapper">
		<div class="content">
		 <div class="row">
		  <div class="col-12">
        	<div class="box" >
        <div class="mx-auto my-3" style="width: 1200px">
            <form class="form-inline "  id="form">
                <div class="form-group mb-2">
                  <h5>輸入關鍵字:</h5>
                </div>
                <div class="form-group mx-sm-3 mb-2">
                  <label for="inputKeyword" class="sr-only">keyword</label>
                  <input type="text" class="form-control"  name="keyword" id="keyword" placeholder="Search..">
                  <Input type='hidden' name='order' value='DESC'>
                </div>
                <div class="form-group col-md-2">
                    <label for="regionkeywd">地區:</label>
                    <select class="form-control"  name="regionkeywd" id="regionkeywd" >
                        <option value="">請選擇..</option>
                        <option value="基隆市">基隆市</option>
                        <option value="新北市">新北市</option>
                        <option value="臺北市">臺北市</option>
                        <option value="桃園市">桃園市</option>
                        <option value="新竹市">新竹市</option>
                        <option value="新竹縣">新竹縣</option>
                        <option value="苗栗縣">苗栗縣</option>
                        <option value="宜蘭縣">宜蘭縣</option>
                        <option value="臺中市">臺中市</option>
                        <option value="彰化縣">彰化縣</option>
                        <option value="南投縣">南投縣</option>
                        <option value="雲林縣">雲林縣</option>
                        <option value="嘉義市">嘉義市</option>
                        <option value="嘉義縣">嘉義縣</option>
                        <option value="臺南市">臺南市</option>
                        <option value="高雄市">高雄市</option>
                        <option value="屏東縣">屏東縣</option>
                        <option value="花蓮縣">花蓮縣</option>
                        <option value="臺東縣">臺東縣</option>
                        <option value="澎湖縣">澎湖縣</option>
                        <option value="金門縣">金門縣</option>
                        <option value="連江縣">連江縣</option>
                    </select>
                  </div>
                  <div class="form-group col-md-2">
                    <label for="typekeywd">類型:</label>
                    <select class="form-control" name="typekeywd" id="typekeywd">
                      <option value="">請選擇..</option>
                      <option value="飯店">飯店</option>
                      <option value="民宿">民宿</option>
                      <option value="汽車旅館">汽車旅館</option>
                    </select>
                  </div>      
                <button type="button" class="btn btn-primary mx-2 mr-2" id="search" name="search">搜尋</button>
                <button type="submit" class="btn btn-primary mr-2" id="resetkeyword">清空關鍵字</button>
                <button type="button" class="btn btn-success" id="insert" onclick="clickcreate()">新增飯店</button>
              </form>
            </div>
            <h2>飯店列表</h2>
  <!--------------------------------------------以上為搜尋列----------------------------------------------------------->  
  <!--------------------------------------------以下為飯店內容--------------------------------------------------------->
        <br>
        <div class="table-responsive">
        <table class="table table-striped table-sm" id="table">
            <thead> 
            <tr>
                <th><div>
							<Input type='hidden' name='order' id="order" value=''>ID
							<Input type='hidden' name='orderfiled' id="orderfiled" value='SN'> 
							<button id="sort" class="id-btn">
								<i class="fa fa-fw fa-sort" id="uSort"></i>
							</button> 
						<script>
						$('.id-btn').click(function(){
							var order = $('#order').val();
							$('#orderfiled').val('SN');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>	
							
					</div></th>
                <th>名稱</th>
                <th>地區</th>
                <th>地址</th>
                <th>住宿類型</th>                                            
                <th><div>
							<Input type='hidden' name='order' id="order" value=''>狀態
							<Input type='hidden' name='orderfiled' id="orderfiled" value='STATUS'> 
							<button id="sort1" class="status-btn">
							<i class="fa fa-fw fa-sort" id="uSort"></i>
							</button> 
						<script>
						$('.status-btn').click(function(){
							var order = $('#order').val();
							$('#orderfiled').val('STATUS');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>		
					</div></th>
				<th>修改</th>
                <th>刪除</th>
            </tr>
            </thead>
            <tbody id="tbody">
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

         </tbody>
        </table>
        </div>
        <div id="page">
				<nav aria-label="...">
					<ul class="pagination">
						
								<li class="page-item first" id ="fBtn">
									<button type="button" class="page-link first" id="page-first" value="first">第一頁</button>
								</li>
							
							
								<!--previous -->
								<li class="page-item previous" id="pBtn">
									<button class="page-link previous " id="page-previous" value="previous">&laquo;</button>
<!-- 										<button class="page-link previous " id="page-previous" value="previous">上一頁</button> -->
								</li>
							
							
								<!--current page -->
								<li class="page-item active">
									<button class="page-link" class="sr-only" id="page-btn" name="currentPage" value="${currentPage}">${currentPage}/${totalPage}</button>
								</li>
						
								<!--NEXT -->
								<li class="page-item next" id ="nBtn">
									<button class="page-link next" id="page-next" value="next">&raquo;</button>
<!-- 									<button class="page-link next" id="page-next" value="next">下一頁</button> -->
								</li>
							
							
							
								<li class="page-item last" id ="lBtn">
									<button class="page-link last" id="page-last" value="last">最末頁</button>
								</li>
							
					
					</ul>
				</nav>
			</div>
        
        
        <script type="text/javascript"> 
        var currentPage = 1;
		var totalPage = 1;

// 		$(document).ready(function() {
// 			var keyword = $("#keyword").val()
// 			var regionkeywd = $("#regionkeywd").val()
// 			var typekeywd = $("#typekeywd").val()
// 			$("#tbody").children().remove();
// 			$.ajax(
// 					{
// 						type: 'POST',
// 						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd },
// 						url: '${pageContext.servletContext.contextPath}/admin/hotelselect',
// 						dataType: 'html',
// 						success: function (response) {
// 							$("#tbody").append(response)

// 						}

// 					}
// 				)
// 			});
        
		$("#table").on('change', '#checkbox', function () {
				var SN = $(this).closest('td').siblings("#SN").text()
				var STATUS =$(this).val();
				var aaa =$(this);
				console.log(STATUS)
				$.ajax(
					{
						type: 'POST',
						data: { "upId": SN, "upStatus": STATUS },
						url: '${pageContext.servletContext.contextPath}/admin/hotelstatus',
						dataType: 'text',
						success: function (response) {
// 							console.log(response)
                             if(STATUS=="啟用")
                            	 aaa.val("禁用")
                                 else
                                	 aaa.val("啟用")    

						}
					}
				)
			
		  })
		
		$("#search").click(function () {
			console.log("搜尋")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			var currentPage=1
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled,"keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#regionkeywd").on('change' ,function () {
			console.log("地區搜尋")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			var currentPage=1
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled,"keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order,"currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#typekeywd").on('change' ,function () {
			console.log("類型搜尋")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			var currentPage=1
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled,"keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order,"currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#sort").click(function () {
			console.log("編號排序")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order, "currentPage" : currentPage  },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#sort1").click(function () {
			console.log("排序狀態")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order, "currentPage" : currentPage  },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
 		$("#page-first").click(function () {
			console.log("第一頁")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			var pagebotton = $("#page-first").val()
			currentPage = 1;
			console.log("keyword =" + keyword);
			console.log("regionkeywd =" + regionkeywd);
			console.log("typekeywd =" + typekeywd);
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled,"keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order, "pagebotton" : pagebotton, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#page-previous").click(function () {
			console.log("前一頁")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			var pagebotton = $("#page-previous").val()
			currentPage--;
			console.log("keyword =" + keyword);
			console.log("regionkeywd =" + regionkeywd);
			console.log("typekeywd =" + typekeywd);
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled,"keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order, "pagebotton" : pagebotton, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		$("#page-next").click(function () {
			console.log("下一頁")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			var pagebotton = $("#page-next").val()
			currentPage++;
			console.log("keyword =" + keyword);
			console.log("regionkeywd =" + regionkeywd);
			console.log("typekeywd =" + typekeywd);
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled,"keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response);

						}

					}
				)
		})
		
		$("#page-last").click(function () {
			console.log("末頁")
			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
			var order = $("#order").val()
			var pagebotton = $("#page-last").val()
			//var currentPage = $("#page-btn").val()
			currentPage = totalPage;
			console.log("keyword =" + keyword);
			console.log("regionkeywd =" + regionkeywd);
			console.log("typekeywd =" + typekeywd);
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled,"keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "order": order, "pagebotton" : pagebotton, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})
		
		function clickdetail(id){

			document.location.href="${pageContext.servletContext.contextPath}/admin/hoteldetail?detailsn="+id;

		}

		function clickcreate(){

			document.location.href="${pageContext.servletContext.contextPath}/admin/hotelcreateurl";

		}
		

		$('#resetkeyword').click(function(){
			console.log("clear");
		  $("#keyword").val('');
		  $('#regionkeywd').val('');
		  $('#typekeywd').val('');
		})
		
		
		</script> 
		
<!-- 		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> -->
<!--          <div class="modal-dialog modal-dialog-centered" role="document"> -->
<!--            <div class="modal-content"> -->
<!--              <div class="modal-header"> -->
<!--                <h5 class="modal-title" id="exampleModalCenterTitle">刪除</h5> -->
<!--                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                  <span aria-hidden="true">&times;</span> -->
<!--                </button> -->
<!--              </div> -->
<!--              <div class="modal-body"> -->
<!--                 <form action="hoteldelete" method="POST"> -->
<!--                     <div class="form-group"> -->
<!--                       <label for="recipient-name" class="col-form-label"></label> -->
<!--                       <input type="hidden" id = "deleteId" value="" name="deleteId"> -->
<!--                       <input type="hidden" id = "deleteName" value="" name="deleteName"> -->
<!--                       <p id="testid"></p> -->
<!--                       <h4>是否確認刪除?</h4> -->
<!--                     </div> -->
<!--                		 <div class="modal-footer"> -->
<!--                  	 <button type="submit" class="btn btn-primary">確認</button> -->
<!--                   	<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> -->
<!--                		 </div> -->
<!--                   </form>  -->
<!--              </div> -->
<!--            </div> -->
<!--          </div> -->
<!--        </div> -->
					</div>	
 				</div>
			 </div>
		  </div>
		  </div>
		</div>
	</div>

</body>
</html>
