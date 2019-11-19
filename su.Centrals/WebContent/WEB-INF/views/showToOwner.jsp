<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Santral Sahibi</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- mdn links -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.7/css/mdb.min.css" rel="stylesheet">




<style type="text/css">
  	.navbar.bg-light{
  		background-color: #3e6299 !important;
  		height: 12%;
  		transition: ease 1s;
/*   		position: relative; */
  	}
  	.user-profile{
  		width: 2.25vw;
  		height: 4vh;
  		background-color: #f1f1f1;
  	}

  	.navbar ul.navbar-nav li.nav-item.ets-right-0 .dropdown-menu{
  		left: auto;
  		right: 0;
  		position: absolute;
  	} 
  	.side-bar{
   		position: fixed;
	  	top:10%;
  		left:0;
  		padding: 15px;
  		display: inline-block;
  		width: 2%;
  		background-color: #828fad;
  		box-shadow: 0px 0px 8px #ccc;
  		height: 100vh;
  		transition: ease 0.5s; 
  		overflow-y: auto;
  	}
  	.main-body-content{
  		display: inline-block;
  		padding: 15px;
  		background-color:#e8eaff;
  		height: 100%;
  		padding-left: 3vw;
  		transition: ease 0.5s; 
  		margin-top:3vh;
  	}
  	.ets-pt{
  		padding-top: 100px;
  	}


  	a {
  		color: #5a5423
  	}
  	.navbar-brand{
  		color: #5a5423
  	}
  	.center{
  		padding-top: 10px;
  	}
  	

  	.resp-font-3 {
	 font-size:3vw;
}
.resp-font-2 {
	 font-size:2vw;
}
.resp-font-1 {
	 font-size:1vw;
}

.resp-font-6 {
	 font-size:6vw;
}

.resp-font-1 li{
	font-size:1vw;
}

  	
.faults tr {
    font-weight: bold;
}
.faults td {
    font-weight: bold;
}

.boldIt td{
	font-weight: bold;
	border-bottom: 0.5px solid #817da8;
	border-top: 0.5px solid #817da8;
}
.boldIt th{
	font-weight: bold;
	border-bottom: 0.5px solid #817da8;
	border-top: 0.5px solid #817da8;
}

.table-hover tbody tr:hover {
  background-color: rgba(0, 0, 0, 0.2) !important;
}
/* #817da8 */
thead th {
    background-color: #817da8;
    color: white;
}  	

.responsive{
  		max-width: 15vw;
		height: 8vh;
	}

	.badge-custom{
	background-color: #a5b1c2;
}
    .img-responsive{
  		max-width: 100%;
		height: auto;
	}
faults tr {
    cursor: pointer;
    font-weight: bold;
}
.faults td {
    font-weight: bold;
}

.fa-3x{padding-top:0.2vh}

.faults tr {
    cursor: pointer;
    font-weight: bold;
}
.faults td {
    font-weight: bold;
}

.boldIt{
	font-weight: bold;
}

.boldIt td{
	font-weight: bold;
	border-bottom: 0.5px solid #817da8;
	border-top: 0.5px solid #817da8;
}
.boldIt th{
	font-weight: bold;
	border-bottom: 0.5px solid #817da8;
	border-top: 0.5px solid #817da8;
}

.faultsTable{
	width: 40vw;
	float: left;
	padding: 3vh;
}

.center {
	margin-top:5vh;
  	margin-left:5vw;
  width: 30vw;
  height: 25vh;
  border: 3px solid #817da8;
  padding-top: 3vh;
  padding-left: 3vw;
}
.tableFault{
	width: 54vw;
	margin-left: 13vw;
	border: 2px solid #817da8;
}

.tableFault tr td{
	padding-top: 8px;
	padding-bottom: 8px;
}
.tableFault tr th{
	padding-top: 8px;
	padding-bottom: 8px;
}

p input {
  border: none;
  display: inline;
  font-family: inherit;
  font-size: inherit;
  padding: none;
  width: auto;
  background-color: transparent;
  font-weight: bold;
}

td p {
 font-size:1vw;
}
  </style>
  <script  type="text/javascript">
  function allTableDailyProductForCihaz(row){
	  var a_t = document.getElementById("allTableA_t"+row).innerHTML;
	  var g_t = document.getElementById("allTableG_t"+row).innerHTML;
	  var xwh = document.getElementById("allTableXwh"+row).innerHTML;
      var value = document.getElementById("allTableDatum"+row).innerHTML;
      if(xwh == 'KWh') var unit = 10000;
 	  else var unit = 10000000;
 	  var result2 = (value * a_t * g_t);
 	  var result = result2/unit;
 	  if(isNaN(result)) {
 		  document.getElementById("dailyProduct"+row).innerHTML = "5 Gündür Veri Girilmemis Veya Ayni deger girilmis.";
 		  
 	  }
 	  else {
 	  	  result = numberWithCommas(result);
 		  var resultFinal = result+" "+xwh;
 		  document.getElementById("dailyProduct"+row).innerHTML = resultFinal;
 	  }
	}
  	
  	function numberWithCommas(x) {
	    var parts = x.toString().split(".");
	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    return parts.join(".");
	}
  	
  	
  	</script>
  </head>
  <body>
  	<div id="page-container" class="main-admin">
	  	<nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed w-100" style="z-index:3">
		  <div >
	  				<a href=""><img class="responsive" src="https://i.postimg.cc/ZKWLNB0g/logo.png"></a> 
	  		</div>
		    <ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown ets-right-0">
		       		<a class="nav-link btn btn-lg responsive resp-font-2" style="color:white;" href="${pageContext.request.contextPath}/showToOwner" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">Üretim Verileri
		       		<img src="https://www.knowyourcompliance.com/wp-content/uploads/2018/03/GDPR-Data-Protection-Policy-Template.png" class="img-fluid rounded-circle border user-profile">
		        	</a>
		      	</li>
				<li class="nav-item dropdown ets-right-0">
		       		<a class="nav-link btn btn-lg responsive resp-font-2" style="color:white;" href="${pageContext.request.contextPath}/santralArizalari" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">Arıza Kayıtları
		       		<img src="https://cdn3.iconfinder.com/data/icons/car-indicator-lights-2/512/Warning_Light-color-45-512.png" class="img-fluid rounded-circle border user-profile">
		        	</a>
		      	</li>
		      	<li class="nav-item dropdown ets-right-0">
		       		<a class="nav-link btn btn-lg responsive resp-font-2" style="color:white;" href="${pageContext.request.contextPath}/logout" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">Çıkış
		       		<img src="http://pearshapedexeter.com/wp-content/uploads/2014/11/EXIT.jpeg" class="img-fluid rounded-circle border user-profile">
		        	</a>
		      	</li>
		    </ul>
		</nav>
	  	<div class="side-bar">

	  	</div>
	  	
	  	
  	<div class="main-body-content w-100 ets-pt"  style="z-index:1;">

  		<c:if test="${showCentralThings}">
			<div class="form-inline w-80">
				    <div class="form-inline w-50">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-inline">
				    <h1><span class="badge badge-custom font-italic">${rows[0][7]}</span></h1>
				    </div>
				    
				</div>
			<div class="table-responsive bg-color">
				
	  			<table class="table table-hover table-striped table-hover">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Veri İsmi</th>
	  					<th>Veri Giren Kullanıcı</th>
	  					<th>Ekleme Tarihi</th>
	  					<th>Ekleme Saati</th>
	  					<th>Sayaç Değeri Farkı</th>
	  					<th>Günlük Sayaç Değeri</th>
	  					<th>A-T</th>
	  					<th>G-T</th>
	  					<th>xWh</th>
	  					<th>Günlük Cihaz Üretimi</th>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable">
	  				<c:forEach var="row" items="${rows}" varStatus="loop">
	  				<tr>
	  					<th>${row[0]}</th>
	  					<td>${row[1]}</td>
	  					<td>${row[2]}</td>
	  					<td id="dateRowParamAll">${row[3]}</td>
	  					<td>${row[4]}</td>
	  					<td><p id="allTableDatum${row[0]}" style="font-size: 0.7vw;">${row[5] == 0 ? '5 Gündür Veri Girilmemiş' : row[5]}</p></td>
	  					<td>${row[6]}</td>
	  					<td id="allTableA_t${row[0]}">${row[9]}</td>
	  					<td id="allTableG_t${row[0]}">${row[10]}</td>
	  					<td id="allTableXwh${row[0]}">${row[11] == 10000 ? 'KWh' : 'MWh'}</td>
	  					<td><p class="font-weight-bold" style="font-size: 0.7vw;" id="dailyProduct${row[0]}"><script>allTableDailyProductForCihaz('${row[0]}');</script></p></td>
	  				</tr>
	  				<c:if test="${rows[loop.index+1][3] != row[3]}">
	  				<tr style="background-color:grey;"><td/><td/><td/><td/><td/><td/><td/><td/><td/><td/><td/></tr></c:if>
	  				</c:forEach>
	  			</tbody>
	  			</table>
			</div>
		</c:if>
		
		
		
		<c:if test="${faultsShowToOwner}">
			<div class="table-responsive bg-color">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Tüm Arızalar</span></h1>
				    </div>
				</div>
	  			<table class="table table-hover table-striped table-hover">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Tekniker Kullanıcı Adı</th>
	  					<th>Tekniker Adı-Soyadı</th>
	  					<th>Santral Adı</th>
	  					<th>Arıza Türü</th>
	  					<th>Açılma Tarihi</th>
	  					<th>Açılma Saati</th>
	  					<th>AKtiflik Durumu</th>
	  					<th>Görülme Durumu</th>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable" class="faults">
	  				<c:forEach var="fault" items="${faults}" varStatus="loop">
<%-- 	  				<tr onclick="document.location = '${pageContext.request.contextPath}/santralArizalari/${fault[0]}';" <c:if test="${!fault[8]}">style="background-color: grey;"</c:if> <c:if test="${fault[8]}"> <c:if test="${fault[9]}">class="bg-success"</c:if> <c:if test="${!fault[9]}">class="bg-danger"</c:if> </c:if>> --%>
 	  					<c:if test="${!fault[8]}"><tr onclick="document.location = '${pageContext.request.contextPath}/santralArizalari/${fault[0]}';" style="background-color: grey;"></c:if>
 	  					<c:if test="${fault[8]}"><c:if test="${fault[9]}"><tr onclick="document.location = '${pageContext.request.contextPath}/santralArizalari/${fault[0]}';" class="bg-success"></c:if><c:if test="${!fault[9]}"><tr onclick="document.location = '${pageContext.request.contextPath}/santralArizalari/${fault[0]}';" class="bg-danger"></c:if></c:if>
 	  					<th>${fault[1]}</th>
	  					<td>${fault[2]}</td>
	  					<td>${fault[3]}</td>
	  					<td>${fault[4]}</td>
	  					<td>${fault[5]}</td>
	  					<td>${fault[6]}</td>
	  					<td>${fault[7]}</td>
	  					<td>${fault[8] ? "Aktif" : "Sonlandirilmis"}</td>
	  					<td>${fault[9] ? "Yeni" : "Görülmüs"}</td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
			</div>
			<c:if test="${empty faults}">
				<h1 class="text-center"><span class="badge badge-secondary font-italic">Hiç Arıza Kaydı Bulunmuyor</span></h1>
			</c:if>
		</c:if>
		
		
		
		<c:if test="${faultShowToOwner}">
				<div class="form-inline">
					<div class="form-group p2" style="padding-left: 1%;">
						
				   		<a class="resp-font-2" href="${pageContext.request.contextPath}/santralArizalari" style="padding-bottom:0.3vh;"><span class="badge badge-light"><i class="fas fa-reply" style="padding-right:0.1vw;"></i>Tüm Arizalar</span></a>
				    </div>
				    <div class="form-group p2" style="margin-left: 25vw;">
				    	<a class="resp-font-2" href="#"><span class="badge badge-light">ARIZA</span></a>
				    </div>
				</div>
				<form method="POST">
	  			<table id="tableFault" class="table table-hover table-striped table-hover boldIt tableFault">
	  				<tr>
	  				
	  					<th colspan="1">Santral Adı :</th>
	  					<td colspan="1"><p><input readonly name="centralName" type="text" value="${fault[1]}" /></p></td>
	  					<th colspan="1">Cihaz Adı :</th>
	  					<td colspan="1"><p><input readonly name="deviceName" type="text" value="${fault[2]}" /></p></td>
	  				</tr>
					<tr>
	  					<th colspan="1">Teknikerin Adı Soyadı :</th>
	  					<td colspan="2"><p><input readonly name="techNameSurname" type="text" value="${fault[3]}" /></p></td>
	  					<td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Arıza Türü :</th>
	  					<td colspan="1"><p><input readonly name="faultType" type="text" value="${fault[4]}" /></p></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Aktiflik Durumu :</th>
	  					<c:if test="${fault[5]}"><td colspan="3" class="bg-success text-color-white text-center"><p><input readonly name="matn" type="text" value="Aktif" /></p></td></c:if>
	  					<c:if test="${!fault[5]}"><td colspan="3" class="text-color-white text-center" style="background-color:grey;"><p><input readonly type="text" value="Sonlandırılmış" /></p></td></c:if>
 					</tr>
	  				<tr>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Oluşturulma Tarihi :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name=openD type="text" value="${fault[6]}" /></p></td>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Olşsturulma Saati :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name="openT" type="text" value="${fault[7]}" /></p></td>
	  					
	  				</tr>
	  				<tr>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Kapanma Tarihi :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name="closeDate" type="text" value="${fault[8]}" /></p></td>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Kapanma Saati :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name="closeT" type="text" value="${fault[9]}" /></p></td>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Arıza Mesajı :</th>
	  					<td colspan="1"><textarea maxlength="500" rows="6" cols="35" class="form-control form-control-inline">${fault[10]}</textarea></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr class="bg-dark"><td colspan="4"/></tr> 
	  				<tr>
	  					<th colspan="1">Tespit Edilen Arızalar :</th>
	  					<td colspan="1"><textarea maxlength="500" required rows="6" cols="35" name="situatedFaults" class="form-control form-control-inline">${fault[13]}</textarea></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Yapılan İşlemler :</th>
	  					<th colspan="1"><textarea maxlength="500" required rows="6" cols="35" name="fixingWays" class="form-control form-control-inline">${fault[14]}</textarea></th>
	  					<th colspan="1"/><th colspan="1"/>
	  				</tr>
	  				
	  				<tr class="materialLabels">
	  					<td style="border: none;" colspan="1" rowspan="1"><p class="text-center">Kullanılan Malzemeler</p></td>
	  					<td style="border: none;" colspan="1" rowspan="1"><p class="text-center">Adet / Metre</p></td>
	  					<td style="border: none;" colspan="2" rowspan="1"><p class="text-center">Açıklamalar</p></td>
	  				</tr>
	  				<c:if test="${empty faultResultMaterials}">
	  				<tr>
	  						<td colspan="1"><div class="form-group centered"><div class="col-sm-12"><p class="form-control form-control-inline">Henüz Veri Girilmemiş</p></div></div></td>
	  						<td colspan="1"><div class="form-group centered"><div class="col-sm-7"><p class="form-control form-control-inline">Henüz Veri Girilmemiş</p></div></div></td>
	  						<td colspan="2"><div class="form-group centered"><div class="col-sm-12"><p class="form-control form-control-inline">Henüz Veri Girilmemiş</p></div></div></td>
	  					</tr>
	  				</c:if>
	  				<c:forEach var="faultResultMaterials" items="${faultResultMaterials}">
	  					<tr>
	  						<td colspan="1"><div class="form-group centered"><div class="col-sm-12"><p class="form-control form-control-inline"><input readonly name="matn" type="text" value="${faultResultMaterials[1]}" /></p></div></div></td>
	  						<td colspan="1"><div class="form-group centered"><div class="col-sm-7"><p class="form-control form-control-inline"><input readonly name="matqua" type="text" value="${faultResultMaterials[2]}" /></p></div></div></td>
	  						<td colspan="2"><div class="form-group centered"><div class="col-sm-12"><p class="form-control form-control-inline"><input readonly name="matexp" type="text" value="${faultResultMaterials[3]}" /></p></div></div></td>
	  					</tr>
	  				</c:forEach>
	  				
	  				
	  				<tr>
	  					<th colspan="1">Genel Aciklamalar :</th>
	  					<td colspan="1"><textarea maxlength="500" required rows="6" cols="35" name="result" class="form-control form-control-inline">${fault[11]}</textarea></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
		  			<c:if test="${!fault[5]}">
		  			<tr>
			  			<td colspan="4">
			  				<button type="submit"  class="btn bg-primary text-white" formaction="${pageContext.request.contextPath}/servisRaporu" formmethod="POST"><i class="fas fa-download"></i>  Servis Raporunu Oluştur</button>
			  			</td>
		  			</tr>
					</c:if>
	  			</table>
	  			
	  			</form>
		</c:if>

		
		

<c:if test="${!showPage}">
<h1 class="text-center"><span class="badge badge-danger font-italic">YETKİSİZ ERİŞİM LÜTFEN GERİ DONÜNÜZ</span></h1>

</c:if>

  	</div>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script type="text/javascript">
    $(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
    
    </script>
</body>
</html>