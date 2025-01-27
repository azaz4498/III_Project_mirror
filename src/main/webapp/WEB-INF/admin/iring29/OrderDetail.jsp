<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUN x TAIWAN</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="/WEB-INF/admin/fragment/user_ref.jsp" /> 

<style>
.cart_area {
    margin: 50px auto;
    margin-top: 50px; 
    margin-left: 200px;
}
.form-control.time{
	width:100px;
	margin-top:10px;
}
.form-control.p_num{
	width:85px;
}
.col-sm-12.col-md-10.col-md-offset-1{
	width:1150px;
}
.div_title{
	width:150px;
	padding-top:10px;
}
.content{
	width:250px;
	padding-top:10px;
	padding-right: 10px;
}
.div_title.input{
	width:130px;
	padding-top:10px;
/* 	float:left; */
}
.form-control.data{
	width:250px;
}
.media-heading{
	height: 48px;
}
.deposit{
	width:80px;
	text-align: center;
}
h5{
	font-size:16px;
	height:48px;
}
.form-control{
	font-size:16px;
}
.col-sm-8.col-md-6{
	width:130px;
}

.media-heading.line{
	font-size:16px;
	height:25px;
}
td.col-sm-1.col-md-1.text-center{
	padding-left:50px;
}
</style>
</style>

</head>
<body>
   <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 
    
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <script>
    $(".nav-shop__circle").html("");
//     console.log($(".nav-shop__circle").val());
    console.log("nu = " + ${cartnum});
// 	   console.log("num");
    </script>
    
    <!-- background -->
    <div class="hero-wrap js-fullheight" style="background-image: url('direngine-master/images/order.jpeg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2">FUN x 臺灣</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">訂單成立，開始旅行吧！</h1>
          </div>
        </div>
      </div>
    </div><!-- .background -->
    
<section class="cart_area" id="index">

<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<c:forEach var="H" items="${hotel_lists}">
					<thead>
						<tr>
							<h2>飯店訂單訊息</h2>
						</tr>
						<tr>
							<th><h5 class="media-heading line">飯店訂單&emsp;<strong>${H.SN_ORDER}</strong></h5></th>
							<th><h5 class="media-heading line"></h5></th>
							<th><h5 class="media-heading line">訂位時間</h5></th>
							<th></th>
							<th class="text-center"><h5 class="media-heading line">訂位人數</h5></th>
							<th class="text-center"><h5 class="media-heading line">價格</h5></th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<div class="media-body">
										<div class="div_title"><h5 class="media-heading">飯店名稱&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading">飯店地址&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading line">訂房人姓名&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading line">訂房人電話&emsp;</h5></div>
									</div>
								</div>
							</td>
							<td>
							<div class="content"><h5>${H.hotel.NAME}</h5></div>
							<div class="content"><h5>${H.hotel.ADDRESS}</h5></div>
							<div class="content"><h5 class="media-heading line">${H.CLIENT_NAME}</h5></div>
							<div class="content"><h5 class="media-heading line">${H.CLIENT_PHONE}</h5></div>
							</td>
							<td>
							<div class="div_title"><h5>入住日期</h5></div>
							<div class="div_title"><h5>退房日期</h5></div>
							</td>
							<td>
							<div class="content"><h5 class="media-heading line">${H.CHECK_IN}</h5></div>
							<div class="content"><h5 class="media-heading line">${H.CHECK_OUT}</h5></div>
							</td>
					
							<td class="col-sm-1 col-md-1 text-center"><h5>${H.PROPLE_NUM}&emsp;&emsp;</h5></td>
							<td class="col-sm-1 col-md-1">
								<h5><strong class="hPRICE">${H.hPRICE}</strong></h5>
							</td>
							<td class="col-sm-1 col-md-1"></td>
						</tr>
					</c:forEach>
						

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h4>小計 $</h4></td>
							<td class="text-right">
							<h3><strong id="HPrice"></strong></h3></td>
						</tr>
					</tbody>
				</table>
				<script type="text/javascript">
  						var hPRICE = document.getElementsByClassName("hPRICE"); 
  						console.log("deposit size = " + hPRICE.length); 
  						var size = 0; 
  						for(var j = 0; j < hPRICE.length; j++ ){
   							size += parseInt(hPRICE[j].innerHTML); 
   							console.log("money = " + size); 
 							console.log("money = " + [j].innerHTML); 
  						}
          				document.getElementById("HPrice").innerHTML = size; 

        				
    					</script> 
			</div>
		</div>
	</div>


<!-- 餐廳 start -->

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<c:forEach var="R" items="${res_lists}">
					<thead>
						<tr>
							<h2>餐廳訂單訊息</h2>
						</tr>
						<tr>
							<th><h5 class="media-heading line">餐廳訂單&emsp;<strong>${R.id}</strong></h5></th>
							<th><h5 class="media-heading line"></h5></th>
							<th><h5 class="media-heading line">訂位時間</h5></th>
							<th class="text-center"><h5 class="media-heading line">訂位人數</h5></th>
							<th class="text-center"><h5 class="media-heading line">價格</h5></th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<div class="media-body">
										<div class="div_title"><h5 class="media-heading">餐廳名稱&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading">餐廳地址&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading line">訂位人姓名&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading line">訂位人電話&emsp;</h5></div>
									</div>
								</div>
							</td>
							<td>
							<div class="content"><h5>${R.restaurant.name}</h5></div>
							<div class="content"><h5>${R.restaurant.address}</h5></div>
							<div class="content"><h5 class="media-heading line">${R.cus_name}</h5></div>
							<div class="content"><h5 class="media-heading line">${R.cus_phone}</h5></div>
							</td>
							<td class="col-sm-1 col-md-1" >
<%-- 								<input type="date" name="book_date" id="theDate${R.restaurant.name}" class="form-control"> --%>
								<c:set var="booktime" value="${R.bookt_time}" />
								<c:set var="bd" value="${fn:substring(booktime, 0, 10)}" />
								<c:set var="bt" value="${fn:substring(booktime, 11, 16)}" />
								<h5>${bd}&emsp;${bt}</h5>
							</td>
					
							<td class="col-sm-1 col-md-1 text-center"><h5>${R.customer_num}&emsp;&emsp;</h5></td>
							<td class="col-sm-1 col-md-1">
								<h5><strong class="deposit">${R.deposit}</strong></h5>
							</td>
							<td class="col-sm-1 col-md-1"></td>
						</tr>
					</c:forEach>
						

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h4>小計 $</h4></td>
							<td class="text-right">
							<h3><strong id="tPrice"></strong></h3></td>
						</tr>
					</tbody>
				</table>
					<script type="text/javascript">
						var deposit = document.getElementsByClassName("deposit");
						console.log("deposit size = " + deposit.length);
						var size = 0;
						for(var i = 0; i < deposit.length; i++ ){
							size += parseInt(deposit[i].innerHTML);
							console.log("money = " + size);
							console.log("money = " + deposit[i].innerHTML);
							}
        				document.getElementById("tPrice").innerHTML = size;
        				
   					</script>
			</div>
		</div>
	</div>

<!-- 餐廳 END -->


<!-- 交通 -->

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
				<c:forEach var="T" items="${t_Order_Lists}">

					<thead>
						<tr>
							<h2>交通訂單訊息</h2>
						</tr>
						<tr>
							<th>交通訂單 ${T.t_sn_order}</th>
							<th></th>
							<th class="text-center">張數</th>
							<th class="text-center">價格</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									
									<div class="media-body">
										<h4 class="media-heading">車次${T.highSpeedRail.idHSR}</h4>
										<h5 class="media-heading">
											姓名: ${T.customerName}
										</h5>
										<h5 class="media-heading">
											電話: ${T.customerPhone}
										</h5>
									</div>
								</div>
							</td>
							<td class="col-sm-1 col-md-1" style="text-align: center">
								<!-- <input type="email" class="form-control" id="exampleInputEmail1" value="3"> -->
							</td>
							<td class="col-sm-1 col-md-1 text-center"><strong id="tNum">${T.nums_days} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</strong></td>
							<td class="col-sm-1 col-md-1 text-center"><strong id="tPrice2">${T.ticketPrice}</strong></td>
							<td class="col-sm-1 col-md-1">
								<!-- <button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button> -->
							</td>
						</tr>

						<tr>
							<td> </td>
							<td> </td>
							<td><h4>小計 $ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h4></td>
							<td></td>
							<td class="text-right"><h3>
									<strong id="TT"></strong>
								</h3></td>
						</tr>

					</tbody>
				</c:forEach>
				</table>
				
			</div>
		</div>
	</div>

<!-- 交通 -->

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">

				<table class="table table-hover">
					<tbody>
						<tr>
							<td class="total"> </td>
							<td><h3>總金額</h3></td>
							<td class="text-right"><h2>
									<strong id="sumPrice">$ ${totalPrice}</strong>
								</h2></td>
						</tr>
					</tbody>
				</table>
				<!-- 總金額 -->
					<!-- <script type="text/javascript">
					var Rsum = document.getElementById("tPrice").innerHTML;
					var Hsum = document.getElementById("HPrice").innerHTML;
					var TotalSum = parseInt(Rsum) + parseInt(Hsum);
					console.log("sum = " + Rsum);
					document.getElementById("sumPrice").innerHTML = TotalSum;
					
					function sumprice(){
						var Rsum = document.getElementById("tPrice").innerHTML;
						var Hsum = document.getElementById("HPrice").innerHTML;
						var TotalSum = parseInt(Rsum) + parseInt(Hsum);
						console.log("sum = " + Rsum);
						document.getElementById("sumPrice").innerHTML = TotalSum;
					}
					</script> -->
			</div>
		</div>
	</div>
	
		<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">

				<table class="table table-hover">
					<tbody>
						<tr>
							<td  class="total"> </td>
							<td></td>
							<td></td>
							<td>
							<form action="<%=pageContext.getServletContext().getContextPath()%>/FunTaiwan">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									繼續逛
								</button>
							</form>
							</td>
							<td>
<!-- 								<button type="button" class="btn btn-success"> -->
<!-- 									我要結帳 <span class="glyphicon glyphicon-play"></span> -->
<!-- 								</button> -->
							</td>
							<td></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

    <script>
      $(document).ready(function(){
		$('body,html').delay(1000).animate({scrollTop: $("#index").offset().top - 160}, 600); 
		var a = $('#tNum').html();
		var b = $('#tPrice2').html();
		var c = parseInt(a)*parseInt(b);
		$('#TT').html(c);
		console.log("--------------a"+a);
      });

    </script>
	<!-- footer -->
     <c:import url="/WEB-INF/admin/fragment/footer.jsp"/> 

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>    
    
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
</body>
</html>