<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<style>
.sp_search-1 {
	float: left;
}

.box {
	display: flex;
}

.search {
	padding-right: 30px;
}

input {
	height: 40px;
}

.sp_search {
	padding: 10px;
	float: left;
}

select {
	float: left;
}

#inputState.form-control {
	width: 200px;
	padding-left: 20px;
}

h2 {
	padding-top: 30px;
	padding-bottom: 30px;
}

.content-wrapper {
	padding-left: 50px;
	padding-top: 50px;
}
</style>

</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">


	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">


				<div class="d-flex justify-content-between">
					<form action="${pageContext.servletContext.contextPath}/articleSearch" method="GET" class="form-inline">
						<input type="text" class="form-control" placeholder="輸入文章標題或作者..." aria-label="search" name="keyword">
						<input type="hidden" value="${articleType }" name="articleType">
						<button>
							<span class="input-group-text bg-primary text-white"> 搜尋 </span>
						</button>
					</form>
					<form action="${pageContext.servletContext.contextPath}/artTypeSearch" method="GET" class="mr-5">

						<select name="articleType" id="typeSelect" class="form-control" onchange="this.form.submit()">
							<option value="">選擇類型</option>
							<option value="1">旅遊</option>
							<option value="2">住宿</option>
							<option value="3">美食</option>
							<option value="4">景點</option>
							<option value="5">交通</option>
							<option value="6">行程</option>
							<option value="7">購物</option>
							<option value="0">其他</option>

						</select>
					</form>
				</div>


				<!-- </div> -->
				<h2>文章列表</h2>
				<span>
					<a href="${pageContext.servletContext.contextPath}/Forum">回列表</a>
				</span>
				
				<div class="box">

					<div class="table-responsive">
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th><span class="mdi mdi-key		"></span> ID</th>
									<th width="40%"><span class="mdi mdi-tag-text-outline"></span> Title</th>
									<th><span class="mdi mdi-calendar-clock"></span> Create Time</th>
									<th><span class="mdi mdi-account-edit"></span> Author</th>
									<th><span class="mdi mdi-directions-fork"></span> Type</th>
									<th><span class="mdi mdi-information-outline"></span>Status</th>
									<th><span class="mdi mdi-settings"></span>Operation</th>


								</tr>
							</thead>
							<tbody>
								<c:forEach var="article" items="${artBean}">
									<tr>
										<td>${article.artId}</td>
										<td><a class="text-dark" href="${pageContext.servletContext.contextPath}/article/${article.artId}"> ${article.artTitle}</a></td>
										<td>${article.artCreTime}</td>
										<td><a class="text-dark" href="">${article.artUserId}</a></td>
										<td>${article.articleType.typeName}</td>
										<td>
											<form id="changeStatus" name="changeStatus" method="POST"
												action="${pageContext.servletContext.contextPath}/statusChange.controller">
												<input type="hidden" value="${article.artId }" name="artId">
												<label class="switch switch-success switch-pill switch-text form-control-label"> <!-- check status -->
													<c:if test="${article.artStatus=='enabled'}">
														<input type="checkbox" class="switch-input form-check-input" name="status" id="status"
															value="${article.artStatus}" checked onclick="this.form.submit()">
													</c:if> <c:if test="${article.artStatus=='disabled'}">
														<input type="checkbox" class="switch-input form-check-input" name="status" id="status"
															value="${article.artStatus}" onclick="this.form.submit()">
													</c:if> <span class="switch-label" data-on="on" data-off="off"></span> <span class="switch-handle"></span>
												</label>
											</form>
										</td>

										<td>
											<form action="${pageContext.servletContext.contextPath}/editPage.controller" method="GET">
												<button name="artId" value="${article.artId}">
													<span class="mdi mdi-pencil-box-outline"></span>
													Edit
												</button>
											</form>



											<form id="delete" name="delete" method="POST"
												action="${pageContext.servletContext.contextPath}/delete.controller">
												<button name="artId" value="${article.artId}" onclick="confirmDelete()">
													<span class="mdi mdi-delete"></span>
													Delete
												</button>
											</form>
										</td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
	</div>

	<script>
		function confirmDelete() {
			var desicion = confirm("確定要刪除此筆資料?");
			if (desicion) {

				document.forms["delete"].submit();
			} else {
				return;
			}
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
</body>

</html>