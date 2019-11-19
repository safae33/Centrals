<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tekniker</title>
<link rel="shortcut icon" href="http://www.iconj.com/ico/w/p/wpglyhvz4c.ico" type="image/x-icon" />

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>




<!-- mdn links -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.7/css/mdb.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>




<style type="text/css">
  	.navbar.bg-light{
  		background-color: #3e6299 !important;
  		height: 10%;
  		transition: ease 0.5s;
  		position: relative;
  	}
  	.user-profile{
  		width: 50px;
  		height: 50px;
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
  		height: 100vh;
  		padding-left: 100px;
  		transition: ease 0.5s; 
  	}
  	.ets-pt{
  		padding-top: 100px;
  	}

  	/**** end effacts ****/
  	.side-bar .side-bar-links{
  		opacity: 0;
  		transition:  ease 0.5s;
  	}
  	.side-bar .side-bar-links ul.navbar-nav li a{
  		font-size: 14px;
  		color: #000;
  		font-weight: 500;
  		padding: 10px;
  	}
  	.side-bar .side-bar-links ul.navbar-nav li a i{
  		font-size:20px;
  		color: #8ac1f6;
  	}
  	.side-bar .side-bar-links ul.navbar-nav li a:hover, .side-bar-links ul.navbar-nav li a:focus{
  		text-decoration: none;
  		background-color: #8ac1f6;
  		color:#fff;
  	}
  	.side-bar .side-bar-links ul.navbar-nav li a:hover i{
  		color:#fff;
  	}
  	.side-bar .side-bar-logo img{
  		width: 169px;
  		height: 157px;
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
  	
  	.main-body-content{
  		display: inline-block;
  		background-color:#e8eaff;
  		height: 99vh;
		padding-top: 11vh;
		padding-left: 3vw;
  		transition: ease 0.5s; 
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
.main-body-content{
  		display: inline-block;
  		background-color:#e8eaff;
  		height: 99vh;
		padding-top: 11vh;
		padding-left: 3vw;
  		transition: ease 0.5s; 
  	}
  	
.fa-3x{padding-top:0.2vh}

.faults tr {
    cursor: pointer;
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

.faultsTable{
	width: 40vw;
	float: left;
	padding: 3vh;
	border-radius: 10px;
}

.center {

  	margin-left:6vw;
  width: 80vw;

  padding-top: 3vh;
  padding-left: 3vw;
}
.tableFault{
	width: 52vw;
	margin-left: 13vw;
	border: 2px solid #817da8;
}	
.table-hover tbody tr:hover {
  background-color: rgba(0, 0, 0, 0.2) !important;
}
/* #817da8 */
thead th {
    background-color: #817da8;
    color: white;
}
.main-body-content{
  		display: inline-block;
  		background-color:#e8eaff;
  		height: 99vh;
		padding-top: 11vh;
		padding-left: 3vw;
  		transition: ease 0.5s; 
  	}
  	
.form-control-inline {
    min-width: 0;
    width: auto;
    display: inline;
}
.centered {
  display: flex;
  align-items: center;
  justify-content: center;
}









.pinkBg {
    background-color: #ed184f!important;
    background-image: linear-gradient(90deg, #fd5581, #fd8b55);
}
.intro-banner-vdo-play-btn{
    height:60px;
    width:60px;
    position:absolute;
    top:50%;
    left:50%;
    text-align:center;
    margin:-30px 0 0 -30px;
    border-radius:100px;
    z-index:1
}
.intro-banner-vdo-play-btn i{
    line-height:56px;
    font-size:30px
}
.intro-banner-vdo-play-btn .ripple{
    position:absolute;
    width:160px;
    height:160px;
    z-index:-1;
    left:50%;
    top:50%;
    opacity:0;
    margin:-80px 0 0 -80px;
    border-radius:100px;
    -webkit-animation:ripple 1.8s infinite;
    animation:ripple 1.8s infinite
}

@-webkit-keyframes ripple{
    0%{
        opacity:1;
        -webkit-transform:scale(0);
        transform:scale(0)
    }
    100%{
        opacity:0;
        -webkit-transform:scale(1);
        transform:scale(1)
    }
}
@keyframes ripple{
    0%{
        opacity:1;
        -webkit-transform:scale(0);
        transform:scale(0)
    }
    100%{
        opacity:0;
        -webkit-transform:scale(1);
        transform:scale(1)
    }
}
.intro-banner-vdo-play-btn .ripple:nth-child(2){
    animation-delay:.3s;
    -webkit-animation-delay:.3s
}
.intro-banner-vdo-play-btn .ripple:nth-child(3){
    animation-delay:.6s;
    -webkit-animation-delay:.6s
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

#tableFault th {
font-size:1vw;
}
.img-responsive{
  		width: 60%;
		height: 20%;
	}
  </style>
  </head>
  <body>
  	<div id="page-container" class="main-admin">
	  	<nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed w-100" style="z-index:3">
		  <div class="logoClass">
	  				<a href="#"><img class="img-responsive" src="https://i.postimg.cc/ZKWLNB0g/logo.png"></a>
	  			</div>
		    <ul class="navbar-nav ml-auto">
				<c:if test="${newFaultCheck}">
		    <li class="nav-item">
				<div class="row">
					<div class="container">
						<div class="row">
							<a href="${pageContext.request.contextPath}/tech" class="intro-banner-vdo-play-btn pinkBg">
								<i class="glyphicon glyphicon-play whiteText" aria-hidden="true"></i>
								<span class="ripple pinkBg"></span>
								<span class="ripple pinkBg"></span>
								<span class="ripple pinkBg"></span>
							</a>
						</div>
					</div>
				</div>
		      </li>
		    </c:if>
		      	<li class="nav-item dropdown ets-right-0">
		       		<a class="nav-link btn btn-lg" style="color:white;" href="${pageContext.request.contextPath}/logout" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">Cikis
		       		<img src="http://pearshapedexeter.com/wp-content/uploads/2014/11/EXIT.jpeg" class="img-fluid rounded-circle border user-profile">
		        	</a>
		      	</li>
		    </ul>
		</nav>
	  	<div class="side-bar">
	  	</div>
  	<div class="main-body-content table-responsive w-98" style="z-index:1; height:100vh;">
  	
<!-- ******************************************************* TÜM ARIZALARI LISTELE ******************************************************** -->
<c:if test="${showAllFaults}">
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
	  					<th>Santral Adı</th>
	  					<th>Arıza Yazan Kullanıcı</th>
	  					<th>Arıza Türü</th>
	  					<th>Açılma Tarihi</th>
	  					<th>AKtiflik Durumu</th>
	  					<th>Yenilik Durumu</th>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable" class="faults">
	  				<c:forEach var="fault" items="${faults}">
<%-- 	  				<tr onclick="document.location = '${pageContext.request.contextPath}/tech/${fault[6]}';" <c:if test="${!fault[4]}">style="background-color: grey;"</c:if> <c:if test="${fault[4]}"> <c:if test="${fault[5]}">class="bg-success"</c:if> <c:if test="${!fault[5]}">class="bg-danger"</c:if> </c:if>> --%>
 	  					<c:if test="${!fault[4]}"><tr onclick="document.location = '${pageContext.request.contextPath}/tech/${fault[6]}';" style="background-color: grey;"></c:if>
 	  					<c:if test="${fault[4]}"><c:if test="${fault[5]}"><tr onclick="document.location = '${pageContext.request.contextPath}/tech/${fault[6]}';" class="bg-success"></c:if><c:if test="${!fault[5]}"><tr onclick="document.location = '${pageContext.request.contextPath}/tech/${fault[6]}';" class="bg-danger"></c:if></c:if>
 	  					<th>${fault[0]}</th>
	  					<td>${fault[1]}</td>
	  					<td>${fault[2]}</td>
	  					<td>${fault[3]}</td>
	  					<td>${fault[7]}</td>
	  					<td>${fault[4] ? "Aktif" : "Kapatılmış"}</td>
	  					<td>${fault[5] ? "Yeni" : "Bakılmış"}</td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
	</div>		
</c:if>

<!-- ******************************************************* TEK ARIZA GÖSTER ******************************************************** -->
<c:if test="${showFault}">
	<div class="table-responsive bg-color center">
				<div class="form-inline">
					<div class="form-group p2" style="padding-left: 1%;">
						
				   		<a class="resp-font-2" href="${pageContext.request.contextPath}/tech" style="padding-bottom:0.3vh;"><span class="badge badge-light"><i class="fas fa-reply" style="padding-right:0.1vw;"></i>Tüm Arızalar</span></a>
				    </div>
				    <div class="form-group p2" style="margin-left: 25vw;">
				    	<a class="resp-font-2" href="${pageContext.request.contextPath}/tech/${fault[0]}"><span class="badge badge-light">ARIZA</span></a>
				    </div>
				</div>
				<form method="POST">
	  			<table id="tableFault" class="table table-hover table-striped table-hover boldIt tableFault">
	  				<tr>
	  				
	  					<th colspan="1">Santral Adı :</th>
	  					<td colspan="1"><p><input readonly name="matn" type="text" value="${fault[1]}" /></p></td>
	  					<th colspan="1">Cihaz Adı :</th>
	  					<td colspan="1"><p><input readonly name="matn" type="text" value="${fault[2]}" /></p></td>
	  				</tr>
					<tr>
	  					<th colspan="1">Teknikerin Adı Soyadı :</th>
	  					<td colspan="1"><p><input readonly name="matn" type="text" value="${fault[3]}" /></p></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Arıza Türü :</th>
	  					<td colspan="1"><p><input readonly name="matn" type="text" value="${fault[4]}" /></p></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Aktiflik Durumu :</th>
	  					<c:if test="${fault[5]}"><td colspan="1" class="bg-success text-color-white"><p><input readonly name="matn" type="text" value="Aktif" /></p></td></c:if>
	  					<c:if test="${!fault[5]}"><td colspan="1" class="text-color-white" style="background-color:grey;"><p><input readonly name="matn" type="text" value="Sonlandırılmış" /></p></td></c:if>
	  				</tr>
	  				<tr>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Oluşturulma Tarihi :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name="matn" type="text" value="${fault[6]}" /></p></td>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Oluşturulma Saati :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name="matn" type="text" value="${fault[7]}" /></p></td>
	  					
	  				</tr>
	  				<tr>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Kapanma Tarihi :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name="matn" type="text" value="${fault[8]}" /></p></td>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Kapanma Saati :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;"><p><input readonly name="matn" type="text" value="${fault[9]}" /></p></td>
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
	  				<tr id="materialRow">
	  					<td colspan="1"><div class="form-group centered"><div class="col-sm-12"><input class="form-control form-control-inline" required type="text" name="materialName" placeholder="Kullanılan Malzeme"></div></div></td>
	  					<td colspan="1"><div class="form-group centered"><div class="col-sm-7"><input class="form-control form-control-inline" required type="text" name="materialQuantity" placeholder="Adet / Metre"></div></div></td>
	  					<td colspan="2"><div class="form-group centered"><div class="col-sm-12"><input class="form-control form-control-inline" required type="text" name="materialExplanation" placeholder="Açıklama"></div></div></td>
	  				</tr>
	  				
	  				<tr id="materialTh" style="cursor: pointer;" class="bg-primary">
	  					<th onclick="addMaterialSpend();" colspan="4"><div class="row text-center"><div class="col"><a>+++Yeni Malzeme Eklemek İçin Tıklayın+++</a></div></div></th>
	  				</tr>
	  				</c:if>
	  				
	  				<c:if test="${!empty faultResultMaterials}">
	  					<c:forEach var="faultResultMaterials" items="${faultResultMaterials}">
	  					<tr>
	  						<td colspan="1"><div class="form-group centered"><div class="col-sm-12"><p class="form-control form-control-inline"><input readonly name="matn" type="text" value="${faultResultMaterials[1]}" /></p></div></div></td>
	  						<td colspan="1"><div class="form-group centered"><div class="col-sm-7"><p class="form-control form-control-inline"><input readonly name="matqua" type="text" value="${faultResultMaterials[2]}" /></p></div></div></td>
	  						<td colspan="2"><div class="form-group centered"><div class="col-sm-12"><p class="form-control form-control-inline"><input readonly name="matexp" type="text" value="${faultResultMaterials[3]}" /></p></div></div></td>
	  					</tr>
	  					</c:forEach>
	  				</c:if>
	  				
	  				
	  				<tr>
	  					<th colspan="1">Genel Açıklamalar :</th>
	  					<td colspan="1"><textarea maxlength="500" required rows="6" cols="35" name="result" class="form-control form-control-inline">${fault[11]}</textarea></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<c:if test="${fault[5]}">
	  				<tr><td colspan="4"><div class="row text-center"><div class="col"><button type="submit" class="btn bg-danger text-white" formaction="${pageContext.request.contextPath}/tech/closeFault/${fault[0]}">Arıza Kaydını Sonlandır</button></div></div></td></tr>
	  				</c:if>
	  			</table>
	  			
	  			</form>
	</div>	


</c:if>

</div>
</div>
</body>
<style>
.boldIt materialLabels td{
	border-bottom: none;
}
.boldIt materialLabels th{
	border-bottom: none;
}</style>

<script type="text/javascript">
function addMaterialSpend(){
	if($("tr[id=materialRow]").length<5){
		$("#tableFault #materialTh").before('<tr id="materialRow"><td colspan="1"><div class="form-group centered"><div class="col-sm-12"><input class="form-control form-control-inline" required type="text" name="materialName" placeholder="Kullanılan Malzeme"></div></div></td><td colspan="1"><div class="form-group centered"><div class="col-sm-7"><input class="form-control form-control-inline" required type="text" name="materialQuantity" placeholder="Adet / Metre"></div></div></td><td colspan="2"><div class="form-group centered"><div class="col-sm-12"><input class="form-control form-control-inline" required type="text" name="materialExplanation" placeholder="Aciklama"></div></div></td></tr>');

	}
	else{
		alert("Kullanılan malzeme sayısı 5 ile sınırlıdır.");
	}
		
}
// $("#addUserTable tr:last").before("");


</script>
</html>