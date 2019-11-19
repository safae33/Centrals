
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<meta charset="utf-8">  
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Yönetici</title>
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
  		background-color: #23395A !important;
  		transition: ease 0.5s;
  		position: inherit;
  	}
  	.user-profile{
  		width: 50px;
  		height: 50px;
  		background-color: #f1f1f1;
  	}
  	.navbar .menu-bar{
/*   		display: inline-block; */
		display: z-index1;
  		width: 50px;
  		height: 50px;
/*   		margin-right: 10px; */
  		cursor: pointer;
  	}
  	.navbar .menu-bar .bars{
  		position: relative;
  		top:50%;
  		width:30px;
  		height: 2px;
  		background-color: #fff;
  	}
  	.navbar .menu-bar .bars::after{
  		content: "";
  		position: absolute;
  		bottom: -8px;
  		width: 100%;
  		height: 2px;
  		background-color: #23395A;
  	}
  	.navbar .menu-bar .bars::before{
  		content: "";
  		position: absolute;
  		top:-8px;
  		width: 100%;
  		height: 2px;
  		background-color: #fff;
  	}
  	.navbar ul.navbar-nav li.nav-item.ets-right-0 .dropdown-menu{
   		left: auto;
  		right: 0;

  	} 
  	.side-bar{
  		position: absolute;
	  	top:81px;
  		left:0;
  		padding: 15px;
  		display: inline-block;
  		width: 2%;
  		background-color: #828fad;
  		border-radius:10px;
/*   		box-shadow: 0px 0px 8px #ccc; */
  		height: 91.2vh;
  		transition: ease 0.5s; 
   		overflow-y: auto;
/*   		z-index:6; */
  	}
  	.main-body-content{
  		display: inline-block;
  		background-color:#e8eaff;
  		height: 90vh;
		padding-left: 3vw;
		padding-top: 1vw;
  		transition: ease 0.5s; 
  	}
  	.main-admin.show-menu .side-bar{
  		width: 13vw;
  	}

  	.main-admin.show-menu .main-body-content{
  		padding-left: 14vw;
  	}
  	.main-admin.show-menu .navbar .menu-bar .bars{
  		width: 15px;
  	}
  	.main-admin.show-menu .navbar .menu-bar .bars::after{
  		width: 10px;
  	}
  	.main-admin.show-menu .navbar .menu-bar .bars::before{
  		width: 25px;
  	}
  	.main-admin.show-menu .side-bar-links{
  		opacity: 1;
  	}
  	.main-admin.show-menu .side-bar .side-bar-icons{
  		opacity: 0;
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
  	.img-responsive{
  		max-width: 100%;
		height: auto;
	}

  	a {
  		color: #5a5423
  	}
  	.navbar-brand{
  		color: #5a5423
  	}

       
   .btn{
   color: white:
   }
   
   
#circle {
    position: absolute;
    top: 75%;
    left: 85%;
    transform: translate(-50%,-50%);
	width: 150px;
    height: 150px;	
}

.loader {
    width: calc(100% - 0px);
	height: calc(100% - 0px);
	border: 8px solid #162534;
	border-top: 8px solid #09f;
	border-radius: 50%;
	animation: rotate 5s linear infinite;
}

@keyframes rotate {
100% {transform: rotate(360deg);}
} 



.table-hover tbody tr:hover {
  background-color: rgba(0, 0, 0, 0.2) !important;
}
/* #817da8 */
thead th {
    background-color: #817da8;
    color: white;
}

.thead-analyze th {
    background-color: #2D5772;
    color: white;
}




/* *********************************************dün analiz bugün */
.bg-gradient {
background: #C9D6FF;
background: -webkit-linear-gradient(to right, #E2E2E2, #C9D6FF); 
background: linear-gradient(to right, #E2E2E2, #C9D6FF);
} 
.ul-show li {
 margin-bottom:1.4rem;
} 
.pricing-divider {
border-radius: 20px;
background: #C64545;
padding: 1em 0 4em;
position: relative;
}
.blue .pricing-divider{
background: #2D5772; 
}
.green .pricing-divider {
background: #1AA85C; 
}
.red .pricing-divider {
background: #C74545; 
}

.pricing-divider-img {
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	
}
.deco-layer {
	-webkit-transition: -webkit-transform 0.5s;
	transition: transform 0.5s;
}
.btn-custom-green  {
  background:#1AA85C; color:#fff; border-radius:20px;
}
.btn-custom-blue  {
  background:#2D5772; color:#fff; border-radius:20px;
}
.btn-custom-red  {
  background:#C64545; color:#fff; border-radius:20px;
}
.btn-custom-red:hover {
 background-color:#ff5454;
 color: #fff;
}
.btn-custom-green:hover {
 background-color:#27e379;
 color: #fff;
}


.princing-item {
  transition: all 150ms ease-out;
  padding-rigth: 100px;
}
.princing-item:hover {
  transform: scale(1.05);
}
.princing-item:hover .deco-layer--1 {
  -webkit-transform: translate3d(15px, 0, 0);
  transform: translate3d(15px, 0, 0);
}
.princing-item:hover .deco-layer--2 {
  -webkit-transform: translate3d(-15px, 0, 0);
  transform: translate3d(-15px, 0, 0);
}

.form-control{
margine-top: 3px;
padding-top: 3px;
}
.div-daily {
  padding-rigth: 5%;
  
}

.div-notMiddle {
  padding-top: 8%;
}

.badge-custom{
background-color: #a5b1c2;
}

.font-family-goody
{ font-family: Times New Roman, serif;
  
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

.labelOk{
	-webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
 	margin-top: 25%;
 	margin-left: 30%;
	z-index:5;
	position: absolute;
	visibility: hidden;
}

.visible{
	visibility: visible;
}
.hidden{
	visibility: hidden;
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

.btn-custom{
padding:10px;

}

.aylikReportDiv{
	 background-color:#ddddf2;
	 border:10px solid #ddddf2;
	 border-radius:10px;
}


.button1 {border-radius: 2px;}
.button2 {border-radius: 4px;}
.button3 {border-radius: 8px;}
.button4 {border-radius: 12px;}
.button5 {border-radius: 50%;}

.pinkThing{
	right:40vw;

}

.resp-button-size{

padding:.5vw 1vw;
font-size:1vw;
line-height:1.25;
border-radius:.3rem
}

.resp-font-.75{
	font-size:0.75vw;
}
  </style>
  
  <script type="text/javascript">
  
  function disableOrEnableAtGtXwhDivs(row){
	  $('div[id="atGtXwhDivs"]:not(:disabled)').each(function() {
		   this.children().prop('disabled',true);
		});
	}
  
  
  
  
  function getResult(name_){
	  var a_tName = name_+'a_t';
	  var g_tName = name_+'g_t';
	  var xwhName = name_+'xwh';
	  var valueName = name_+'value';
	  
	  var ele = document.getElementsByName(a_tName);
	  for(i = 0; i < ele.length; i++) { 
          if(ele[i].checked) var a_t = ele[i].value;
      } 
	  var ele = document.getElementsByName(g_tName);
	  for(i = 0; i < ele.length; i++) { 
          if(ele[i].checked) var g_t = ele[i].value;
      } 
	  var ele = document.getElementsByName(xwhName);
	  for(i = 0; i < ele.length; i++) { 
          if(ele[i].checked) var xwh = ele[i].value;
      }
	  var value = document.getElementById(valueName).innerHTML;
	  
 	  var result = (value * a_t * g_t)/xwh;
 	 if(isNaN(result)) {
  		document.getElementById(name_).innerHTML = 'Eksik Veri Girilmiş';
  	 }
 	else{

 		 if(xwh == 1000) var unit = " KWh";
 	 	  else var unit = " MWh";
 	 	  result = numberWithCommas(result);
		 document.getElementById(name_).innerHTML = result+" "+unit;
	}
 	
 	 
  }
  
  function allTableDailyProductForCihaz(row){
	  var a_t = document.getElementById("allTableA_t"+row).innerHTML;
	  var g_t = document.getElementById("allTableG_t"+row).innerHTML;
	  var xwh = document.getElementById("allTableXwh"+row).innerHTML;
      var value = document.getElementById("allTableDatum"+row).innerHTML;
      if(xwh == 'KWh') var unit = 1000;
 	  else var unit = 1000000;

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
  	
  	
  	
  
	function hideFaultCihaz(){
		$('#faultCihazID').hide();
	}
	function showFaultCihaz(){
		$('#faultCihazID').show();
		var date = $('#date-input').val()
	}
  
	
	
	function filterByDate(){
// 		$(document).ready(function(){
// 			var dateBegin = $('#beginDate').val()
// 			var dateEnd = $('#endDate').val()
// 			alert(dateBegin);
// 			alert(dateEnd);
//   		    $("#myTable tr").filter(function() {
//   		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
//   		    });

//   		});

	}
  </script>
</head>
  <body>
  
  	<div id="page-container" class="main-admin">
  	
	  	<nav class="navbar navbar-expand-lg navbar-light bg-light w-100" style="z-index:2;">
		  <div id="open-menu" class="menu-bar">
		  	<div class="bars"></div>
		  </div>

		    <ul class="navbar-nav ml-auto">
		    <c:if test="${newFaultCheck}">
		    <li class="nav-item dropdown ets-right-0 pinkThing">
				<div class="row">
					<div class="container">
						<div class="row">
							<a href="${pageContext.request.contextPath}/arizalar" class="intro-banner-vdo-play-btn pinkBg">
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
		    
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          <img src="https://cdn3.iconfinder.com/data/icons/car-indicator-lights-2/512/Warning_Light-color-45-512.png" class="img-fluid rounded-circle border user-profile">
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/arizalar">Arıza Kayıtlarını Listele</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/arizaEkle?detached=false">Teknikere İçin Arıza Kaydı Oluştur</a>
		        <div class="dropdown-divider"></div>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/arizaTipiEkle">Arıza Türü Ekle</a>
		        </div>
		        
		      </li>
		      
		      <li class="nav-item dropdown ets-right-0">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          <img src="https://png.pngtree.com/svg/20170808/292fd6a99e.png" class="img-fluid rounded-circle border user-profile">
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/kullanicilar">Kullanıcıları Listele</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/teknikerler">Teknikerleri Listele</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/silinenler">Silinenleri Listele</a>
		        	<div class="dropdown-divider"></div>
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/kullaniciEkle">Kullanıcı Ekle</a>
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/santralEkle">Santral Ekle</a>
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/sifreDegis">Şifre Değiştirme</a>
		          <div class="dropdown-divider"></div>
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Güvenli Çıkış</a>
		        </div>
		      </li>
		    </ul>

		</nav>
		<div>
	  	<div class="side-bar">
	  		<div class="side-bar-links">
	  				<a href="${pageContext.request.contextPath}/"><img class="img-responsive" src="https://i.postimg.cc/ZKWLNB0g/logo.png"></a>
	  			
	  			<ul class="navbar-nav">
	  				<c:forEach var="central" items="${centrals}">
	  				<li style="heigth:2vw;">

	  					<a href="${pageContext.request.contextPath}/${central.getId()}?all=false" class="d-block" style="font-size:1vw;"><i class="fas fa-industry" style="font-size:1vw;"></i> ${central.getName_()}</a>
	  				
	  				</li>
	  				</c:forEach>
	  			</ul>
	  		</div>
	  	</div>
	  	
	  	
	  	<div id="loading" style="display:none;">
    		Loading Please Wait....
   	 	<img src="ajax-loader.gif" alt="Loading" />
		</div>
	  	
	  	
	  	
<!-- *******************************************************ANA BODY IÇERIKLERINI (ORTA KISIM)******************************************************** -->
  	<div class="main-body-content table-responsive w-98" style="z-index:1;">
  	
  	<c:if test="${editOrAddInput}">
  		
  		<c:if test="${!inputAlready}">
  		 <div class="form-inline"  style="background-color: #d6d6ff;">
					<div class="form-group p2" style="padding-left: 1%;">
						
				   		<a class="resp-font-2" href="${pageContext.request.contextPath}/${centralId}?all=false" style="padding-bottom:0.3vh;"><span class="badge badge-light"><i class="fas fa-reply" style="padding-right:0.1vw;"></i>Analiz Ekranına Geri Dön</span></a>
				    </div>
				    <div class="form-group p2" style="margin-left: 20vw;">
				    	<a class="resp-font-2"><span class="badge badge-light">${centralName}</span></a>
				    </div>
			</div>
  		<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
	    <fieldset>
	        <legend class="font-weight-bold">SAYAC VERİLERİNİ YAZINIZ</legend>
	       
	        <form method="POST" action="${pageContext.request.contextPath}/newInput/${centralId}/${day}">
	            <table>
	                <c:forEach var="input" items="${inputNames}">
	                <tr>
	                    <th><p class="resp-font-1 boldIt ">${input} : </p></th>
	                    <td><input name="input" required type="text" class="form-control" placeholder="${input} icin degeri giriniz..." aria-label="Recipient's username" aria-describedby="basic-addon2" /></td>
	                </tr>
	                </c:forEach>
	                <tr>
	                    
	                    <td colspan="2" class="text-center"><button type="submit" class="btn btn-success">Kaydet</button></td>
		                </tr>
		            </table>
		        </form>
		    </fieldset>
		</div>
		</c:if>
		
		
		<c:if test="${inputAlready}">
		<div class="form-inline"  style="background-color: #d6d6ff;">
					<div class="form-group p2" style="padding-left: 1%;">
						
				   		<a class="resp-font-2" href="${pageContext.request.contextPath}/${centralId}?all=false" style="padding-bottom:0.3vh;"><span class="badge badge-light"><i class="fas fa-reply" style="padding-right:0.1vw;"></i>Analiz Ekranına Geri Dön</span></a>
				    </div>
				    <div class="form-group p2" style="margin-left: 20vw;">
				    	<a class="resp-font-2"><span class="badge badge-light">${centralName}</span></a>
				    </div>
			</div>
			<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
			    <fieldset>
			        <legend class="font-weight-bold">SAYAC VERİLERİ GİRİLMİŞ</legend>
			        <form method="POST" action="${pageContext.request.contextPath}/editInput/${centralId}">
			            <table>
		                <c:forEach var="input" items="${inputs}">
		                <tr>
		                    <td><p class="resp-font-1 boldIt">${input[0]} : </p></td>
		                    <td><input name="inputs" type="text" class="resp-font-1 boldIt form-control" value="${input[1]}"/>
		                    <input type="hidden" name="inputIds" value="${input[2]}" /></td>
		                </tr>
		                </c:forEach>
						<tr><th colspan="2" class="text-center"><button type="submit" class="btn btn-success">Kaydet</button></th></tr>
		                <tr>
		                </tr>
			            </table>
			            </form>
			    </fieldset>
			</div>
		</c:if>
		  	
	  	
	  	
  	
  	
  	
  	</c:if>
  	

	<!-- *******************************************************BIR SANTRAL SECILDIGINDE CALISACAK KISIM******************************************************** -->
	<c:if test="${showCentral}">
		<c:if test="${!param.all}"> <!-- *******************************************************TÜMÜNÜ MÜ GÖSTERTEK YOKSA (DÜN BUGÜN ANALIZ) MI ******************************************************** -->
			<div class="form-inline">
			<a class="btn btn-primary" href="?all=true">Tümünü Göster</a>
			<h1 style="padding-left:28vw;"><span class="badge badge-custom font-italic resp-font-2">${centralName}</span></h1>
			</div>
				<div class="container-fluid bg-gradient p-2">
      <div class="row m-auto text-center w-100">
        
        <div class="col-2 princing-item div-notMiddle">
          <div class="pricing-divider div-daily red">
            <p class="text-light font-italic font-weight-normal font-family-goody resp-font-3">Dün</p>
             <svg class='pricing-divider-img' enable-background='new 0 0 300 100' height='100px' id='Layer_1' preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100' width='300px' x='0px' xml:space='preserve' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1' d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2' d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3' d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z' fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4' d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z' fill='#FFFFFF'></path>
        </svg>
          </div>
          <div class="card-body bg-white mt-0 shadow">
            <ul class="list-unstyled mb-5 position-relative ul-show resp-font-1">
            <c:if test="${!empty yesterday}">
				<li class="list-inline-item">
				<b class="form-group resp-font-1">Ekleme Saati</b> <p class="resp-font-.75"><input class="text-center form-control resp-font-.75" readonly name="openT" type="text" value="${addTimeY}" /></p></li>
	            <c:forEach var="input" items="${yesterday}">
	              <li>
	              		<p class="resp-font-.75"><input id="yesterday-${input[1]}" class="text-center form-control resp-font-.75" readonly name="openT" type="text" value="${input[1]} : ${input[3]}" /></p>
	              </li>
	              </c:forEach>
            </c:if>
            <c:if test="${empty yesterday}">
             	<li><p class="resp-font-1 boldIt">Düne Ait Veri Girişi Yapılmamış</p></li>
            </c:if>
            </ul>
            <a type="button" class="btn shadow-lg btn-custom-red resp-button-size" href="${pageContext.request.contextPath}/editOrAddInput/${centralId}/y">Veri Düzenle Veya Ekle</a>
          </div>
        </div>
       

        
        
        <div class="col-8 princing-item">
        <h1 id="labelOk" class="labelOk"><span class="badge badge-success font-italic resp-font-3">TAMAMDIR</span></h1>
          <div class="pricing-divider div-daily blue">
            <p class="text-light font-italic font-weight-normal font-family-goody resp-font-6">Analiz</p>
             <svg class='pricing-divider-img' enable-background='new 0 0 300 100' height='100px' id='Layer_1' preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100' width='300px' x='0px' xml:space='preserve' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1' d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2' d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3' d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z' fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4' d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z' fill='#FFFFFF'></path>
        </svg>
          </div>
          <div class="card-body bg-white mt-0 shadow">
          <c:if test="${!empty diff}">
          <div class="table-responsive card-body bg-white mt-0 shadow">
          		<table class="table table-hover table-striped table-hover table-analyze" id="table-analyze">
	  			<thead class="thead-analyze">
	  				<tr>
	  					<th>#</th>
	  					<th>Veri İsmi</th>
	  					<th>Veri Değeri Farkı</th>
	  					<th>GKÇ</th>
	  					<th>A_T</th>
	  					<th>G_T</th>
	  					<th>xWh</th>
	  					<th>Günlük Üretim</th>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable">
	  				<c:forEach var="input" items="${diff}" varStatus="loop">
	  				<tr>
	  					<th>${loop.index+1}</th>
	  					<th><h6 class="font-weight-bold">${input[0]}:  </h6></th>
	  					<td id="${centralName}/${input[0]}/value">${input[1]}</td>
	  					<td>
	  						<div class="custom-control custom-checkbox">
							    <input type="checkbox" <c:if test="${input[6]}">checked</c:if> class="custom-control-input" id="row${loop.index+1}" name="${input[5]}">
							    <label id="Gkc" class="custom-control-label" for="row${loop.index+1}">GKÇ</label>
							</div>
	  					</td>
	  					<td>
	  						<!-- Default inline 1-->
							<div id="atGtXwhDivs" class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[2] == 3}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-1-1" name="${centralName}/${input[0]}/a_t" value="3">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-1-1">3</label>
							</div>
							
							<!-- Default inline 2-->
							<div id="atGtXwhDivs" class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[2] == 5}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-1-2" name="${centralName}/${input[0]}/a_t" value="5">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-1-2">5</label>
							</div>
						</td>
	  					<td>
						<!-- Default inline 1-->
							<div id="atGtXwhDivs" class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[3] == 315}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-2-1" name="${centralName}/${input[0]}/g_t" value="315">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-2-1">315</label>
							</div>
							
							<!-- Default inline 2-->
							<div id="atGtXwhDivs" class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[3] == 330}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-2-2" name="${centralName}/${input[0]}/g_t" value="330">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-2-2">330</label>
							</div>
							
							<!-- Default inline 2-->
							<div id="atGtXwhDivs" class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[3] == 345}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-2-3" name="${centralName}/${input[0]}/g_t" value="345">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-2-3">345</label>
							</div>
						</td>
	  					<td>
	  					<!-- Default inline 1-->
							<div id="atGtXwhDivs" class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[4] == 1000}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-3-1" name="${centralName}/${input[0]}/xwh" value="1000">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-3-1">KW</label>
							</div>
							
							<!-- Default inline 2-->
							<div id="atGtXwhDivs" class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[4] == 1000000}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-3-2" name="${centralName}/${input[0]}/xwh" value="1000000">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-3-2">MW</label>
							</div>
	  					</td>
	  					<th><a class="resp-font-1" id="${centralName}/${input[0]}/"><script>getResult("${centralName}/${input[0]}/");</script></a></th>
	  					
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
<!--             <button type="button" class="btn btn-lg btn-block btn-custom-blue ">kaldirmak istemiyorum bi ise yarasin bunlar amaa umut: Kaldıracaksın o kadar </button> -->
          </div>
          </c:if>
          <c:if test="${empty diff}">
             	<div class="table-responsive card-body bg-white mt-0 shadow">
          		<table class="table table-hover table-striped table-hover table-analyze" id="table-analyze">
	  			<thead class="thead-analyze">
	  				<tr>
	  					<th>#</th>
	  					<th>Veri İsmi</th>
	  					<th>Veri Değeri Farkı</th>
	  					<th>GKÇ</th>
	  					<th>A_T</th>
	  					<th>G_T</th>
	  					<th>xWh</th>
	  					<th>Günlük Üretim</th>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable">
	  				<c:forEach var="input" items="${table}" varStatus="loop">
	  				<tr>
	  					<th>${loop.index+1}</th>
	  					<th><h6 class="font-weight-bold">${input[0]}:  </h6></th>
	  					<td id="${centralName}/${input[0]}/value">Eksik Veri Girilmiş</td>
	  					<td>
	  						<div class="custom-control custom-checkbox">
							    <input type="checkbox" <c:if test="${input[5]}">checked</c:if> class="custom-control-input" id="row${loop.index+1}" name="${input[4]}">
							    <label id="Gkc" class="custom-control-label" for="row${loop.index+1}">GKÇ</label>
							</div>
	  					</td>
	  					<td>
	  						<!-- Default inline 1-->
							<div class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[1] == 3}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-1-1" name="${centralName}/${input[0]}/a_t" value="3">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-1-1">3</label>
							</div>
							
							<!-- Default inline 2-->
							<div class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[1] == 5}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-1-2" name="${centralName}/${input[0]}/a_t" value="5">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-1-2">5</label>
							</div>
						</td>
	  					<td>
						<!-- Default inline 1-->
							<div class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[2] == 315}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-2-1" name="${centralName}/${input[0]}/g_t" value="315">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-2-1">315</label>
							</div>
							
							<!-- Default inline 2-->
							<div class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[2] == 330}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-2-2" name="${centralName}/${input[0]}/g_t" value="330">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-2-2">330</label>
							</div>
							
							<!-- Default inline 2-->
							<div class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[2] == 345}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-2-3" name="${centralName}/${input[0]}/g_t" value="345">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-2-3">345</label>
							</div>
						</td>
	  					<td>
	  					<!-- Default inline 1-->
							<div class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[3] == 10000}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-3-1" name="${centralName}/${input[0]}/xwh" value="10000">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-3-1">KW</label>
							</div>
							
							<!-- Default inline 2-->
							<div class="custom-control custom-radio custom-control-inline">
							  <input <c:if test="${input[3] == 10000000}">checked</c:if> type="radio" class="custom-control-input" id="row${loop.index+1}-3-2" name="${centralName}/${input[0]}/xwh" value="10000000">
							  <label id="notGkc" class="custom-control-label" for="row${loop.index+1}-3-2">MW</label>
							</div>
	  					</td>
	  					<th><a class="resp-font-1" id="${centralName}/${input[0]}/">Eksik Veri Girilmiş</a></th>
	  					
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
<!--             <button type="button" class="btn btn-lg btn-block btn-custom-blue ">kaldirmak istemiyorum bi ise yarasin bunlar amaa umut: Kaldıracaksın o kadar </button> -->
          </div>
          </c:if>
        </div>
        </div>
               
        
  
        
        
         
        <div class="col-2 princing-item div-notMiddle">
          <div class="pricing-divider div-daily green ">
            <p class="text-light font-italic font-weight-normal font-family-goody resp-font-3">Bugün</p>
             <svg class='pricing-divider-img' enable-background='new 0 0 300 100' height='100px' id='Layer_1' preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100' width='300px' x='0px' xml:space='preserve' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1' d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2' d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3' d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z' fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4' d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z' fill='#FFFFFF'></path>
        </svg>
          </div>

          <div class="card-body bg-white mt-0 shadow">
            <ul class="list-unstyled mb-5 position-relative ul-show resp-font-.75">
            <c:if test="${!empty today}">
				<li class="list-inline-item">
				<b class="form-group resp-font-1">Ekleme Saati</b> <p><input class="text-center form-control resp-font-1" readonly name="openT" type="text" value="${addTimeT}" /></p></li>
	            <c:forEach var="input" items="${today}">
	              <li>
	              		<p class="resp-font-.75"><input  class="text-center form-control resp-font-.75" readonly name="openT" type="text" value="${input[1]} : ${input[3]}" /></p>
	              </li>
	              </c:forEach>
            </c:if>
            <c:if test="${empty today}">
             	<li><p class="resp-font-1 boldIt">Bugüne Ait Veri Girişi Yapılmamış</p></li>
            </c:if>
            </ul>
            <a type="button" class="btn shadow-lg btn-custom-green resp-button-size" href="${pageContext.request.contextPath}/editOrAddInput/${centralId}/t">Veri Düzenle Veya Ekle</a>
          </div>
        </div> 
      </div>
    </div>

		</c:if>
		
		<c:if test="${param.all}"> <!-- ******************************************************* TÜMÜNÜ GÖSTERCEKSE ******************************************************** -->
			<div class="form-inline w-80">
			<div style="width:54%;"><a class="btn btn-primary" style="color: white;" href="?all=false">Günlük Analiz</a></div>
<!-- 			<div class="form-group float-right aylikReportDiv"> -->
<%-- 			<a class="boldIt resp-font-1" style="padding-right:10px">Tarih Başlangıcı</a><input class="form-control" value="${firstAndLastTime[0][0]}" type="date" name="begin" id="beginDate" onchange="filterByDate();"> --%>
<%-- 			<a class="boldIt resp-font-1" style="padding-right:10px; padding-left:20px;">Tarih Sonu</a><input class="form-control" value="${firstAndLastTime[0][1]}" type="date" id="endDate" name="end" onchange="filterByDate();"> --%>
<!-- 			</div> -->
			</div>
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
	  					<td id="allTableXwh${row[0]}">${row[10] == 1000 ? 'KWh' : 'MWh'}</td>
	  					<td><p class="font-weight-bold" style="font-size: 0.7vw;" id="dailyProduct${row[0]}"><script>allTableDailyProductForCihaz('${row[0]}');</script></p></td>
	  				</tr>
	  				<c:if test="${rows[loop.index+1][3] != row[3]}">
<!-- 	  				<tr><td class="bg-success"/><td class="bg-success"/><td class="bg-success"/><td class="bg-success"/><td class="bg-success"/><td class="bg-success"/><td class="bg-success"/><td class="bg-success"/><td class="bg-success"/> -->
<!-- 	  				<td>Günlük Toplam Üretim : <a id="allTableDailyProduct"><span class="badge badge-custom font-italic resp-font-2"></span></a></td></tr> -->
	  				<tr style="background-color:grey;"><td/><td/><td/><td/><td/><td/><td/><td/><td/><td/><td/></tr></c:if>
	  				</c:forEach>
	  			</tbody>
	  			</table>
<%-- 	  			<form method="POST" action="${pageContext.request.contextPath}/report/${rows[0][7]}"> --%>
<!-- 	  				<button class="btn btn-primary float-right">Bu Listeyi Raporla</button> -->
<!-- 	  			</form> -->
	  			
			</div>
		<script type="text/javascript">filterByDate();</script>
		</c:if>
	</c:if>




  	<!-- ******************************************************* TÜM SANTRALLERIN LISTELENDIGI ANA KISIM******************************************************** -->
  	<c:if test="${showAll}">
			<div class="table-responsive bg-color">
				<div class="form-inline w-100">
				    <div class="form-group p-2" style="width:63%">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    
				    <div class="form-group float-right aylikReportDiv ets-right-0">
				    <div style="padding-right:20px;">
				    <form method="POST" action="aylikUretimRaporu" id="aylikUretimRaporuForm">
				    <a class="boldIt resp-font-1" style="padding-left:20px">Yıl-Ay :</a>
				    
				    <select required name="yearMonthSelect" data-style="btn-primary" data-live-search="true" class="selectpicker" data-width="fit" style="padding-right:20px;">
							<option value="${yearAndMonths[0]}" selected class="boldIt">${yearAndMonths[0]}</option>
							<c:forEach var="yearAndMonth" items="${yearAndMonths}" varStatus="loop">
								<c:if test="${not loop.first}">
								<option value="${yearAndMonth}" class="boldIt"> ${yearAndMonth} </option>
								</c:if>
							</c:forEach>
					</select>
					</form>
					</div>
				    <a id="aylikUretimRaporuButton" class="btn btn-primary btn-custom float-right resp-font-1" style="padding-left:20px;"><i class="fas fa-download resp-font-1"></i>  Aylık Rapor Oluştur</a>
					</div>
				</div>
	  			<table class="table table-hover table-striped table-hover"  style="margin-top:20px;">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Santral Adı</th>
	  					<th>Veri Giriş Saati</th>
	  					<th/>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable">
	  				<c:forEach var="central" items="${allCentrals}"  varStatus="loop">
	  				<tr>
	  					<th>${loop.index+1}</th>
	  					<td><h1><a href="${pageContext.request.contextPath}/${central[0]}?all=false" ><span class="badge badge-custom font-italic">${central[1]}</span></a></h1></td>
	  					<c:if test="${central[3]}"><td><h1><span class="badge badge-success font-italic">${central[2]}</span></h1></td></c:if>
	  					<c:if test="${!central[3]}"><td><h1><span class="badge badge-danger font-italic">**Veri Girisi Yapilmadi</span></h1></td></c:if>
	  					<td><form onsubmit="return confirm('Santrali Silmek Istediğinize Emin misiniz? Dileginiz Zaman Silinenler Kısmından Tekrar Aktif Edebilirsiniz.');" method="POST" action="${pageContext.request.contextPath}/delC/${central[0]}"><button class="btn btn-danger" type=submit>Santrali Sil</button></form></td>
	  					
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
	  			<c:if test="${deleteCentralSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Bir Santral Başarıyla Silindi</p></th></tr></c:if>
	  			<c:if test="${activateCentralSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Bir Santral Başarıyla Aktif Hale Getirildi</p></th></tr></c:if>
		</div>
  		</c:if>
  		
  	
  	
  	<!-- ******************************************************* SANTRAL EKLEME ******************************************************** -->
  	<c:if test="${addCentral}">
  		<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
    <fieldset>
        <legend>Santral Ekle</legend>
        <form method="POST" action="addC">
            <table id=addCentralTable>
            <tbody>
                <tr>
                    <th>Santral Adi :</th>
                    <td><input name="name_" required type="text" class="form-control" placeholder="Santral Adini Giriniz..." aria-label="Recipient's username" aria-describedby="basic-addon2" /></td>
                </tr>
                <tr id="inputNums">
                    <th>Girdi Sayisi:</th>
                    <td><select id="inputNums" name="inputNum" class="selectpicker"  onchange="if (this.selectedIndex) inputs()">
							<option value="" disabled selected>Girdi Sayısı Seçiniz...</option>
							<c:forEach var="i" begin="1" end="20">
								<option value="${i}" > ${i} </option>
							</c:forEach>
							
							
					</select></td>
                </tr>
                <c:if test="${addCentralSuccess}"><tr><td/><th><p class="font-italic text-success">**Başarıyla Santral Eklendi</p></th></tr></c:if>
                                
                <tr>
                    <td></td>
                    <td><button id="addCentralButton" type="submit" class="btn btn-success" disabled>Ekle</button></td>
                    <td>
                        <a class="btn btn-danger" style="color: white;" href="${pageContext.request.contextPath}/">Vazgec</a></td>
                </tr>
                                
                </tbody>
                                
            </table>
            <c:if test="${centralAlready}"><tr><th/><th><p class="font-italic text-danger">**Bu santral Zaten Mevcut. Farkli Bir Ad Yazınız. Silinmişleri kontrol edebilirsiniz.</p></th></tr></c:if>
            
        </form>
    </fieldset>
</div>
</c:if>


<!-- ******************************************************* TEKNIKERLERI LISTELE ******************************************************** -->
<c:if test="${listTechs}">
<div class="table-responsive bg-color">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Tüm Teknikerler</span></h1>
				    </div>
				</div>
	  			<table class="table table-hover table-striped table-hover">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Tekniker Adı-Soyadı</th>
	  					<th>Kullanıcı Adı</th>
	  					<th>Şifre</th>
	  					<th>Mail</th>
	  					<th/>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable">
	  				<c:forEach var="tech" items="${techs}">
	  				<tr>
	  					<td>${tech[1]}</td>
	  					<td>${tech[2]}</td>
	  					<td>${tech[3]}</td>
	  					<td>${tech[4]}</td>
	  					<td>${tech[5]}</td>
	  					<td><form onsubmit="return confirm('Kullanıcıyı Silmek İstediğinize Emin misiniz? Dilediğiniz Zaman Silinenler Kısmından Tekrar Aktif Edebilirsiniz.');" method="POST" action="${pageContext.request.contextPath}/delU/${tech[0]}"><button class="btn-small btn-danger" type=submit>Teknikeri Sil</button></form></td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
	  			<c:if test="${deleteUserSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Bir Kullanıcı Başarıyla Silindi</p></th></tr></c:if>
	  			<c:if test="${activateUserSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Bir Kullanıcı Başarıyla Aktif Hale Getirildi</p></th></tr></c:if>
		</div>		
</c:if>


<!-- ******************************************************* KULLANICILARI LISTELE ******************************************************** -->
<c:if test="${listUsers}">
<div class="table-responsive bg-color">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Tüm Kullanicilar</span></h1>
				    </div>
				</div>
	  			<table class="table table-hover table-striped table-hover">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Kullanıcı Adı</th>
	  					<th>Şifre</th>
	  					<th>Mail</th>
	  					<th>Kullanıcı Türü</th>
	  					<th>Santral Adı</th>
	  					<th/>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable">
	  				<c:forEach var="user" items="${users}" varStatus="loop">
	  				<tr>
	  					<th>${loop.index+1}</th>
	  					<td>${user[0]}</td>
	  					<td>${user[1]}</td>
	  					<td>${user[5] == "yok@yok.com" ? "-" : user[5]}</td>
	  					<td>${user[2]}</td>
	  					<td>${user[3]}</td>
	  					<td><form onsubmit="return confirm('Kullanıcıyı Silmek İstediğinize Emin misiniz? Dilediğiniz Zaman Silinenler Kısmından Tekrar Aktif Edebilirsiniz.');" method="POST" action="${pageContext.request.contextPath}/delU/${user[4]}"><button class="btn-small btn-danger" type=submit>Kullanıcıyı Sil</button></form></td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
	  			<c:if test="${deleteUserSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Bir Kullanıcı Başarıyla Silindi</p></th></tr></c:if>
	  			<c:if test="${activateUserSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Bir Kullanıcı Başarıyla Aktif Hale Getirildi</p></th></tr></c:if>
	  			<c:if test="${cantDeleteAdmin}"><tr><td/><th><p class="font-italic text-danger">**Admin Türünde Kullanıcıyı Silemezsiniz</p></th></tr></c:if>
		</div>		
</c:if>

<!-- ******************************************************* FAULT TIPI EKLEME ******************************************************** -->
<c:if test="${addFaultType}">
  		<div class="d-flex w-90" style="background-color: #d6d6ff;">
  	<div class="table-responsive bg-color faultsTable">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <a class="resp-font-3" href="${pageContext.request.contextPath}/arizaTipiEkle"><span class="badge badge-light">Tüm Arıza Tipleri</span></a>
				    </div>
				</div>
	  			<table class="table table-hover table-striped table-hover">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Arıza Tipi</th>
	  					<th/>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable" class="boldIt">
	  				<c:forEach var="fType" items="${faultTypes}" varStatus="loop">
	  				<tr>
	  					<td>${loop.index+1}</td>
	  					<td>${fType[1]}</td>
	  					<td><form onsubmit="return confirm('Arıza Tipini Silmek İstediğinize Emin misiniz? Bu İşlemin Geri Dönüşü Olmayacak.');" method="POST" action="${pageContext.request.contextPath}/delF/${fType[0]}"><button class="btn-small btn-danger" type=submit>Arıza Tipini Sil</button></form></td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
	  			<c:if test="${deleteFaultTypeSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Bir Arıza Tipi Başarıyla Silindi</p></th></tr></c:if>
	  			<c:if test="${faultUsageException}"><tr><td/><th><p class="font-italic text-danger">**Bir Arıza Kaydında Kulanılmış Olan Arıza Tipleri Silinemez</p></th></tr></c:if>
	  			
	</div>
	<div class="center">
    <fieldset>
        <legend>Arıza Tipi Ekle</legend>
        <form method="POST" action="${pageContext.request.contextPath}/addF">
            <table>
            <tbody>
                <tr>
                    <th>Arıza Tipi :</th>
                    <td><input name="faultName"  maxlength="38" required type="text" class="form-control" placeholder="Yeni Arıza Tipini Giriniz..." aria-label="Recipient's username" aria-describedby="basic-addon2" /></td>
                </tr>
                
                <c:if test="${addFaultTypeSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Başarıyla Arıza Tipi Eklendi</p></th></tr></c:if>
                                
                <tr>
                    <td/>
                    <td><button type="submit" class="btn btn-success">Ekle</button></td>
                    <td>
                        <a class="btn btn-danger" style="color: white;" href="${pageContext.request.contextPath}/">Vazgec</a></td>
                </tr>
                                
                </tbody>
                                
            </table>
            <c:if test="${faultTypeAlready}"><tr><th/><th><p class="font-italic text-danger">**Bu Arıza Tipi Zaten Mevcut. Farklı Bir Ad Yazınız.</p></th></tr></c:if>
            
        </form>
    </fieldset>
    </div>
</div>
</c:if>

<!-- ******************************************************* TÜM ARIZALARI LISTELE ******************************************************** -->
<c:if test="${showAllFaults}">
<h1 id="labelOk" class="labelOk"><span class="badge badge-success font-italic resp-font-3">TAMAMDIR</span></h1>
	<div class="table-responsive bg-color">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Santrallerden Gelen Tüm Arızalar</span></h1>
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
	  					<th></th>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable" class="faults">
	  				<c:forEach var="fault" items="${faults}">
<%-- 	  				<tr <c:if test="${!fault[4]}">style="background-color: grey;"</c:if> <c:if test="${fault[4]}"> <c:if test="${fault[5]}">class="bg-success"</c:if> <c:if test="${!fault[5]}">class="bg-danger"</c:if> </c:if>> --%>
 	  					<c:if test="${!fault[4]}"><tr style="background-color: grey;"></c:if>
 	  					<c:if test="${fault[4]}"><c:if test="${fault[5]}"><tr class="bg-success"></c:if><c:if test="${!fault[5]}"><tr class="bg-danger"></c:if></c:if>
 	  					
 	  					<th onclick="document.location = '${pageContext.request.contextPath}/ariza/${fault[6]}';">${fault[0]}</th>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/ariza/${fault[6]}';">${fault[1]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/ariza/${fault[6]}';">${fault[2]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/ariza/${fault[6]}';">${fault[3]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/ariza/${fault[6]}';">${fault[7]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/ariza/${fault[6]}';">${fault[4] ? "Aktif" : "Sonlandırılmış"}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/ariza/${fault[6]}';">${fault[5] ? "Yeni" : "Görülmüş"}</td>
	  					<td><form onsubmit="return confirm('Arıza kaydını silmek istediğinize emin misiniz?');" method="POST" action="${pageContext.request.contextPath}/delFault/${fault[6]}/true"><button class="btn-sml btn-danger" type=submit>Arıza Kaydını Sil</button></form></td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
	</div>	
	
	<hr>
	
	<div class="table-responsive bg-color">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Teknikerlere Açılan Tüm Arızalar</span></h1>
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
	  					<th>OSOS</th>
	  					<th></th>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable" class="faults">
	  				<c:forEach var="fault" items="${faultsFromAdmin}" varStatus="loop">
<%-- 	  				<tr <c:if test="${!fault[8]}">style="background-color: grey;"</c:if> <c:if test="${fault[8]}"> <c:if test="${fault[9]}">class="bg-success"</c:if> <c:if test="${!fault[9]}">class="bg-danger"</c:if> </c:if>> --%>
 	  					<c:if test="${!fault[8]}"><tr style="background-color: grey;"></c:if>
 	  					<c:if test="${fault[8]}"><c:if test="${fault[9]}"><tr class="bg-success"></c:if><c:if test="${!fault[9]}"><tr class="bg-danger"></c:if></c:if>
 	  					<th onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[1]}</th>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[2]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[3]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[4]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[5]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[6]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[7]}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[8] ? "Aktif" : "Sonlandirilmis"}</td>
	  					<td onclick="document.location = '${pageContext.request.contextPath}/techAriza/${fault[0]}';" >${fault[9] ? "Yeni" : "Görülmüs"}</td>
	  					<td>
	  						<div class="custom-control custom-checkbox">
							    <input type="checkbox" <c:if test="${fault[10]}">checked</c:if> class="custom-control-input" id="row${loop.index+1}" name="${fault[0]}">
							    <label id="isAllowToOwner" class="custom-control-label" for="row${loop.index+1}">OSOS ?</label>
							</div>
	  					</td>
	  					<td><form onsubmit="return confirm('Arıza kaydını silmek istediğinize emin misiniz?');" method="POST" action="${pageContext.request.contextPath}/delFault/${fault[0]}/false"><button class="btn-sml btn-danger" type=submit>Arıza Kaydını Sil</button></form></td>					
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  			</table>
	</div>	
</c:if>

<!-- ******************************************************* TEKnisyen tek ARIZA GÖSTER ******************************************************** -->
<c:if test="${showTechFault}">

				<div class="form-inline">
					<div class="form-group p2" style="padding-left: 1%;">
						
				   		<a class="resp-font-2" href="${pageContext.request.contextPath}/arizalar" style="padding-bottom:0.3vh;"><span class="badge badge-light"><i class="fas fa-reply" style="padding-right:0.1vw;"></i>Tüm Arizalar</span></a>
				    </div>
				    <div class="form-group p2" style="margin-left: 25vw;">
				    	<a class="resp-font-2" href="${pageContext.request.contextPath}/techAriza/${fault[0]}"><span class="badge badge-light">ARIZA</span></a>
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
	  				
	  				<c:if test="${empty detachedFault}">
		  				<c:if test="${!fault[5]}">
		  					<tr>
			  					<td colspan="4">
			  						<button type="submit"  class="btn bg-primary text-white" formaction="${pageContext.request.contextPath}/servisRaporu" formmethod="POST"><i class="fas fa-download"></i>  Servis Raporunu Oluştur</button>
			  					</td>
		  					</tr>
		  				</c:if>
	  				</c:if>
	  				
	  				<c:if test="${!empty detachedFault}">
	  					<c:if test="${!fault[5]}">
		  					<tr>
				  				<td colspan="3">
				  					<button type="submit"  class="btn bg-danger text-white" formaction="${pageContext.request.contextPath}/servisRaporu" formmethod="POST"><i class="fas fa-download"></i>  Servis Raporunu Oluştur</button>
				  				</td>
				  				<td colspan="1">
				  					<button onclick="disableResult();" type="submit" class="btn btn-primary" formnovalidate formmethod="get" formaction="${pageContext.request.contextPath}/ariza/${detachedFault[0]}">Bağlanan Arızayı Aç</button>
				  				</td>
		  					</tr>
	  					</c:if>
	  					<c:if test="${fault[5]}">
	  						<tr>
	  							<td colspan="4">
				  					<button onclick="disableResult();" type="submit" class="btn btn-primary" formnovalidate formmethod="get" formaction="${pageContext.request.contextPath}/ariza/${detachedFault[0]}">Bağlanan Arızayı Aç</button>
				  				</td>
		  					</tr>
	  					</c:if>
	  				</c:if>

	  			</table>
	  			
	  			</form>



</c:if>


<!-- ******************************************************* TEK ARIZA GÖSTER ******************************************************** -->
<c:if test="${showFault}">
	<div class="table-responsive bg-color">
				<div class="form-inline">
					<div class="form-group p2" style="padding-left: 1%;">
						
				   		<a class="resp-font-2" href="${pageContext.request.contextPath}/arizalar" style="padding-bottom:0.3vh;"><span class="badge badge-light"><i class="fas fa-reply" style="padding-right:0.1vw;"></i>Tüm Arızalar</span></a>
				    </div>
				    <div class="form-group p2" style="margin-left: 25vw;">
				    <a class="resp-font-2" href="${pageContext.request.contextPath}/ariza/${fault[0]}"><span class="badge badge-light">Ariza</span></a>
				    </div>
				</div>
				<form method="get" action="${pageContext.request.contextPath}/arizaEkle?detached=false">
	  			<table class="table table-hover table-striped table-hover boldIt tableFault">
	  				<tr>
	  				
	  					<th colspan="1">Santral Adı :</th>
	  					<td colspan="1">${fault[1]}</td>
	  					<th colspan="1">Cihaz Adı :</th>
	  					<td colspan="1">${fault[2]}</td>
	  				</tr>
					<tr>
	  					<th colspan="1">Arıza Yazan Kullanıcı :</th>
	  					<td colspan="1">${fault[3]}</td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Arıza Türü :</th>
	  					<td colspan="1">${fault[4]}</td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Aktiflik Durumu :</th>
	  					<c:if test="${fault[5]}"><td colspan="1" class="bg-success text-color-white">Aktif</td></c:if>
	  					<c:if test="${!fault[5]}"><td colspan="1" class="text-color-white" style="background-color:grey;">Sonlandırılmış</td></c:if>
	  				</tr>
	  				<tr>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Oluşturulma Tarihi :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">${fault[6]}</td>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Oluşturulma Saati :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">${fault[7]}</td>
	  					
	  				</tr>
	  				<tr>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Kapanma Tarihi :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">${fault[8]}</td>
	  					<th colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">Kapanma Saati :</th>
	  					<td colspan="1" style="border: 0.5px solid #817da8; width: 10vw;">${fault[9]}</td>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Arıza Mesajı :</th>
	  					<td colspan="1"><textarea maxlength="500" rows="4" cols="50">${fault[10]}</textarea></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<tr>
	  					<th colspan="1">Arıza Sonucu :</th>
	  					<td colspan="1"><textarea id="resultId" maxlength="500" required name="result" rows="4" cols="50">${fault[11]}</textarea></td>
	  					<td colspan="1"/><td colspan="1"/>
	  				</tr>
	  				<c:if test="${fault[5]}">
	  				<tr><td colspan="2"><button type="submit"  class="btn bg-danger text-white" formaction="${pageContext.request.contextPath}/closeFault/${fault[0]}" formmethod="POST">Arızayı Kapat</button></td>
	  				<td colspan="2"><input type="hidden" name="detached" value='true'/><input type="hidden" name="faultId" value="${fault[0]}" />
	  				<c:if test="${empty detachedFault}"><button onclick="disableResult();" type="submit" class="btn btn-primary" formnovalidate>Bu Arızayı Bir Teknikere Ata</button></c:if>
	  				<c:if test="${!empty detachedFault}"><button onclick="disableResult();" type="submit" class="btn btn-primary" formnovalidate formaction="${pageContext.request.contextPath}/techAriza/${detachedFault[0]}">Bağlanan Tekniker Arızasını Aç</button></c:if>
	  				</td>
	  				</tr>
	  				</c:if>
	  				
	  				<c:if test="${!fault[5]}">
	  				<c:if test="${!empty detachedFault}">
	  				<tr>
	  				<td colspan="4">
	  					<button onclick="disableResult();" type="submit" class="btn btn-primary" formnovalidate formaction="${pageContext.request.contextPath}/techAriza/${detachedFault[0]}">Bağlanan Tekniker Arızasını Ac</button>
	  				</td>
	  				</tr>
	  				</c:if>
	  				</c:if>
	  			
	  			</table>
	  			</form>
	  			
	</div>	


</c:if>

<!-- ******************************************************* ADD FAULT ******************************************************** -->
<c:if test="${addFault}">
 	
  		<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
    <fieldset>
        <c:if test="${!detach}"><legend><a class="resp-font-2" href="${pageContext.request.contextPath}/arizaEkle?detached=false"><span class="badge badge-light">ARIZA KAYDI OLUSTUR</span></a></legend></c:if>
        <c:if test="${detach}"><legend><a class="resp-font-2" href="${pageContext.request.contextPath}/arizaEkle?detached=false"><span class="badge badge-light">ARIZADAN BAĞIMSIZ KAYIT İÇİN TIKLAYIN</span></a></legend></c:if>
        <form method="POST" id="addFaultForm" action="${pageContext.request.contextPath}/addFault/${faultSpecs[6]}">
            <table id="addFaultTable">
            	<tr>
                    <th>Teknikeri Seçiniz :</th>
                    <td>
                    	<select required name="to_" class="selectpicker">
							<option value="0" disabled selected>Tekniker Seçiniz...</option>
							<c:forEach var="technician" items="${technicians}">
								<option value="${technician[0]}" >${technician[1]} ${technician[2]}</option>
							</c:forEach>
						</select>
					</td>
                </tr>
            	<tr>
            	
                    <th>Arıza Tipi :</th>
                    <td>
                    	<select required name="faultType" class="selectpicker">
							<c:if test="${!detach}"><option disabled selected>Arıza Tipini Seçiniz...</option>
							<c:forEach var="faultType" items="${faultTypes}">
								<option value="${faultType[0]}" > ${faultType[1]} </option>
							</c:forEach></c:if>
							<c:if test="${detach}"><option selected value="${faultSpecs[0]}">${faultSpecs[1]}</option></c:if>
						</select>
					</td>
                </tr>
                <tr>
                    <th>Arıza Oluşan Santral :</th>
                    <td>
                    	
                    	<select required name="centralId" class="selectpicker faultCentralClass">
							<c:if test="${!detach}"><option disabled selected>Santrali Seçiniz...</option>
							<c:forEach var="centralForFault" items="${centralsForFault}">
								<option value="${centralForFault[0]}" > ${centralForFault[1]} </option>
							</c:forEach></c:if>
							<c:if test="${detach}"><option selected value="${faultSpecs[2]}">${faultSpecs[3]}</option></c:if>
						</select>
					</td>
                </tr>
                
                <tr id="faultCihazID">
                    <th>Arıza Olusan Cihaz :</th>
                    <td>
                    	<select required name="inputNameId" class="selectpicker">
                    	<c:if test="${detach}"><option selected value="${faultSpecs[4]}">${faultSpecs[5]}</option></c:if>
                    	<c:if test="${!detach}"><option disabled selected>Cihazı seçiniz...</option></c:if>
						</select>
						<input type="hidden" name="inputNameId" value='0'/>
					</td>
                </tr>
                
                <c:if test="${!param.detached}">
                <script>hideFaultCihaz();</script>
                </c:if>
                <tr>
                    <th>Arıza Hakkında Detay Yazınız :</th>
                    <td>
                    	<textarea required maxlength="500" rows="4" cols="50" name="comment"></textarea>
					</td>
                </tr>
				<c:if test="${addFaultSuccess}"><tr><td/><th><p class="font-italic text-success">**Başarıyla Arıza Kaydı Oluşturuldu</p></th></tr></c:if>
				
                <tr>
                    <td/>
                    <c:if test="${!param.detached}"><td><button id="addFaultButton" type="submit" class="btn btn-success" style="color: #e0dedc;">Oluştur</button></td></c:if>
                    <c:if test="${param.detached}"><td><button type="submit" onclick="addFaultButton();" class="btn btn-success" style="color: #e0dedc;">Oluştur</button></td></c:if>
                    <td><a class="btn btn-danger" style="color: white;" href="${pageContext.request.contextPath}/">Vazgec</a></td>
                </tr>
            </table>
         </form>
    </fieldset>
</div>
</c:if>


<!-- ******************************************************* KULANICI EKLE ******************************************************** -->
<c:if test="${addUser}">
 	
  		<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
    <fieldset>
        <legend>Kullanıcı Ekle</legend>
        <form method="POST" action="${pageContext.request.contextPath}/addU" id="addUserForm">
            <table id=addUserTable>
            <tr id="userType">
                    <th>Kullanıcı Tipi :</th>
                    <td><select required id="userType" name="userType" class="selectpicker" onchange="if (this.selectedIndex) userTypeSelect()">
							<option value="0" disabled selected>Kullanıcı Tipini Seçiniz...</option>
							<option value="1"> Santral Sorumlusu </option>
							<option value="2"> Santral Sahibi </option>
							<option value="3"> Yönetici </option>
							<option value="4"> Tekniker </option>
					</select>
					</td>
                </tr>
                <tr id="centralSelect">
                    <th>Santral :</th>
                    <td><select required id="centralSelect" name="central" class="selectpicker">
							<option value="0" disabled selected>Santral Seçiniz...</option>
							<c:forEach var="central" items="${centrals}">
								<option value="${central.id}" > ${central.name_} </option>
							</c:forEach>
							
					</select>
					</td>
                </tr>
                <tr>
                    <th>Kullanıcı Adı :</th>
                    <td><input name="uName" required type="text" placeholder="Kullanıcı Adını Giriniz..." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" /></td>
                </tr>
                <tr>
                    <th>Şifre :</th>
                    <td><input name="password_" required type="password" class="form-control" placeholder="Şifreyi Giriniz..." aria-label="Recipient's password" aria-describedby="basic-addon2" /></td>
                </tr>
	
				<c:if test="${addUserSuccess}"><tr><td/><th><p class="font-italic text-success">**Başarıyla Kullanıcı Eklendi</p></th></tr></c:if>
				
                <tr>
                    <td></td>
                    <td><button id="addUserButton" class="btn btn-success">Ekle</button></td>
                    <td>
                        <a class="btn btn-danger" style="color: white;" href="${pageContext.request.contextPath}/">Vazgec</a></td>
                </tr>
            </table>
            <c:if test="${userAlready}"><tr><td/><th><p class="font-italic text-danger">**Kullanıcı Adı Mevcut. Farklı Bir Ad Yazınız. Silinmişleri kontrol edebilirsiniz.</p></th></tr></c:if>
            
        </form>
    </fieldset>
</div>
</c:if>




<!-- ******************************************************* SILINENLERI LISTELE ******************************************************** -->
<c:if test="${allDeleteds}">
		<div class="table-responsive bg-color">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Silinen Kullanıcılar</span></h1>
				    </div>
				</div>
	  			<table class="table table-hover table-striped table-hover">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Kullanıcı Adı</th>
	  					<th>Şifre</th>
	  					<th>Kullanıcı Türü</th>
	  					<th>Santral Adı</th>
	  					<th/>
	  				</tr>
	  			</thead>
	  			<tbody id="myTable">
	  				<c:forEach var="user" items="${deletedUsers}" varStatus="loop">
	  				<tr>
	  					<th>${loop.index+1}</th>
	  					<td>${user[0]}</td>
	  					<td>${user[1]}</td>
	  					<td>${user[2]}</td>
	  					<td>${user[3]}</td>
	  					<td><form method="POST" action="${pageContext.request.contextPath}/actU/${user[4]}"><button class="btn-small btn-success" type=submit>Kullanıcıyı Aktif Et</button></form></td>
	  				</tr>
	  				</c:forEach>
	  				<c:if test="${empty deletedUsers}"><tr><td/><th><p class="font-italic text-danger">**Silinmiş Kullanıcı Bulunmuyor</p></th></tr></c:if>
	  			</tbody>
	  			</table>	
		</div>


		<div class="table-responsive bg-color">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInputCentral" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Silinen Santraller</span></h1>
				    </div>
				</div>
	  			<table class="table table-hover table-striped table-hover">
	  			<thead>
	  				<tr>
	  					<th>#</th>
	  					<th>Santral Adı</th>
	  					<th/>
	  				</tr>
	  			</thead>
	  			<tbody id="myTableCentral">
	  				<c:forEach var="central" items="${deletedCentrals}"  varStatus="loop">
	  				<tr>
	  					<th>${loop.index+1}</th>
	  					<td id="centralName"><h1><span class="badge badge-custom font-italic">${central[1]}</span></h1></td>
	  					<td><form method="POST" action="${pageContext.request.contextPath}/actC/${central[0]}"><button class="btn btn-success" type=submit>Santrali Aktif Et</button></form></td>
	  					
	  				</tr>
	  				</c:forEach>
	  				<c:if test="${empty deletedCentrals}"><tr><td/><th><p class="font-italic text-danger">**Silinmis Santral Bulunmuyor</p></th></tr></c:if>
	  			</tbody>
	  			</table>

		</div>
</c:if>



<!-- ******************************************************* SIFRE DEGISTIRME EKRANI ******************************************************** -->
<c:if test="${changePassword}">
	<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
    <fieldset>
        <legend>Şifre Değiştir</legend>
        <form method="POST" action="changeP">
            <table id=addUserTable>
                <tr>
                    <th>Eski Şifre :     </th>
                    <td><input name="oldPw" required type="password" placeholder="Eski Şifreyi Giriniz..." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" /></td>
                </tr>
                <tr>
                    <th>Yeni Şifre :     </th>
                    <td><input type="password" id="txtNewPassword" name="password" required class="form-control" placeholder="Yeni Şifreyi Giriniz..." aria-label="Recipient's password" aria-describedby="basic-addon2" /></td>
                </tr>
                <tr>
                    <th>Yeni Şifre :     </th>
                    <td><input type="password" id="txtConfirmPassword" required class="form-control" placeholder="Yeni Şifreyi Tekrar Giriniz..." aria-label="Recipient's password" aria-describedby="basic-addon2" /></td>
                </tr>
 				<c:if test="${changePasswordSuccess == 1}"><tr><td/><th><p class="font-italic text-success">**Şifre Başarıyla Değiştirildi</p></th></tr></c:if>
 				<c:if test="${changePasswordSuccess == 0}"><tr><td/><th><p class="font-italic text-danger">**Eski Şifre Yanlış Girildi</p></th></tr></c:if>
 				
                <tr>
                    <td/>
                    <td><button id="changePasswordButton" type="submit" class="btn btn-success" disabled>Şifreyi Değiştir</button></td>
                    <td>
                        <a class="btn btn-danger" style="color: white;" href="${pageContext.request.contextPath}/">Vazgec</a></td>
                </tr>
            </table>
        </form>
    </fieldset>
</div>

</c:if>

<!-- <div id="circle"> -->
<!--   <div class="loader"> -->
<!--     <div class="loader"> -->
<!--         <div class="loader"> -->
<!--            <div class="loader"> -->

<!--            </div> -->
<!--         </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div>  -->
</div>
  	</div>
</div>
<script type="text/javascript">
		$(function() {
			jQuery("#page-container").addClass('show-menu');
		});

		
		
    	jQuery(document).ready(function(){
    		jQuery("#open-menu").click(function(){
    			if(jQuery('#page-container').hasClass('show-menu')){
    			jQuery("#page-container").removeClass('show-menu');
    			}
    			else{
    			jQuery("#page-container").addClass('show-menu');
    			}
    		});
    	});
    	
    	
    	
    	function inputs(){
    		
    		while($( "#addCentralTable tr:last").prev().attr("id") != "inputNums"){
    			$( "#addCentralTable tr:last").prev().remove();
    		}
			for(i = 1; i<=parseInt($( "#inputNums option:selected" ).text()); i++){
    			$("#addCentralTable tr:last").before("<tr><th>Girdi " + String(i) + " :</th><td><input name='input' type='text' class='form-control' placeholder='Boş bırakılırsa GES-"+String(i)+" olarak kaydedilecek...'  aria-describedby='basic-addon2' /></td></tr>")
			}
			$( "button[id='addCentralButton']" ).removeAttr("disabled", "disabled").button('refresh');
    	}
    	
    	
    	$('#aylikUretimRaporuButton').click(function(event){
    	    event.preventDefault();
    	    $('#aylikUretimRaporuForm').submit();
    	});
    	
    	$('#addUserButton').click(function(event){
    	    event.preventDefault();
    	    $('#addUserForm').submit();
    	});
    	$('#addFaultButton').click(function(event){
    	    event.preventDefault();
    	    $('#addFaultForm').attr('action', "${pageContext.request.contextPath}/addFault");
    	    $('#addFaultForm').submit();
    	});
    	function addFaultButton(event){
    		event.preventDefault();
    		$('#addFaultForm').submit();

    	}

    	
    	
    	
    	function userTypeSelect(){
    		if($( "#userType option:selected" ).text() == ' Yönetici '){
    			$( "#mail" ).remove();
    			$( "#centralSelect" ).hide();
    			$("#addUserTable tr:last").before('<tr id="mail"><th>Mail Adresi :</th><td><input name="mail" required type="email" class="form-control" placeholder="Mail Adresini Giriniz..."/></td></tr>');
    			$("#addUserTable tr:last").before("<tr id='adminSelected'><td/><th><p class='font-italic text-primary'> Yönetici Seçiminde Santral Seçimi Gerekmez</p></th></tr>");
    			$( "#addUserTable #teknikerSelected" ).remove();
    			$( "button[id='addUserButton']" ).button('refresh');
    		}
    		else if($( "#userType option:selected" ).text() == ' Tekniker '){
    			$( "#centralSelect" ).hide();
    			$( "#mail" ).remove();
    			$( "#adminSelected" ).remove();
    			$("#addUserTable tr:last").before('<tr id="mail"><th>Mail Adresi :</th><td><input name="mail" required type="email" class="form-control" placeholder="Mail Adresini Giriniz..."/></td></tr>');
    			$("#addUserTable tr:last").before("<tr id='teknikerSelected'><th>Tekniker İsmi :</th><td><input name='name_' required type='text' placeholder='Teknikerin İsmini Giriniz...' class='form-control' aria-label='Recipient's username' aria-describedby='basic-addon2' /></td></tr>");
    			$("#addUserTable tr:last").before("<tr id='teknikerSelected'><th>Tekniker Soyismi :</th><td><input name='surname_' required type='text' placeholder='Teknikerin Soyismini Giriniz...' class='form-control' aria-label='Recipient's username' aria-describedby='basic-addon2' /></td></tr>");
    			$( "button[id='addUserButton']" ).button('refresh');
    		}
    		else{
    			$( "#mail" ).remove();
    			$( "#adminSelected" ).remove();
    			$( "#addUserTable #teknikerSelected" ).remove();
    			$( "#centralSelect" ).show();
    			$( "button[id='addUserButton']" ).button('refresh');
    		}
    	}
    	
    	
//     	***************************sifre check JQUERYLERI*******************
    	$(document).ready(function () {
    		   $("#txtConfirmPassword").on("keyup", function() {
    			   if($(this).val() == $("#txtNewPassword").val()){
    				   $( "button[id='changePasswordButton']" ).removeAttr("disabled", "disabled").button('refresh');
    			   }
    			   else{
    				   $( "button[id='changePasswordButton']" ).prop("disabled", "disabled").button('refresh');
    			   }
    		   });
    		});

    	
    	
    	
//     	***************************ARAMA KISIMLARININ JQUERYLERI*******************
    	$(document).ready(function(){
    		  $("#myInput").on("keyup", function() {
    		    var value = $(this).val().toLowerCase();
    		    $("#myTable tr").filter(function() {
    		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    		    });
    		  });
    		});
    	
    	$(document).ready(function(){
  		  $("#myInputCentral").on("keyup", function() {
  		    var value = $(this).val().toLowerCase();
  		    $("#myTableCentral tr").filter(function() {
  		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
  		    });
  		  });
  		});
    	
    	
//     	***************************radio buton degisim aninda database update*******************	 myTable
		$('#myTable label[id=notGkc]').click(async function() {
			var info = $(this).prev().attr('name').split('/');
			var value = $(this).prev().attr('value');
			$.ajax({
			    type: 'POST',
			    url: '${pageContext.request.contextPath}/updInpAttr',
			    data: {
			    	central : info[0],
			    	inputName : info[1],
			    	attr : info[2],
			    	value : value,
			    },
				success: function(data) {
					
					if(jQuery('#labelOk').hasClass('visible')){

		    			jQuery("#labelOk").show();
		        		jQuery("#labelOk").fadeOut("slow");
		    		}
					else{

						jQuery("#labelOk").addClass('visible');
			    		jQuery("#labelOk").fadeOut("slow");
					}

			    },
			});
			await sleep(500);
		    getResult(info[0]+ '/' + info[1] + '/');
		});
		
		function sleep(ms) {
			  return new Promise(resolve => setTimeout(resolve, ms));
			}
		
		
		
		function disableResult(){
			$('textarea[name="result"]').prop('disabled', true);
		}
		
//     	***************************GKÇ*******************	
		$('#myTable label[id=Gkc]').click(async function() {
			var inpNameId = $(this).prev().attr('name');
			$.ajax({
			    type: 'POST',
			    url: '${pageContext.request.contextPath}/changeGKC',
			    data: {
			    	inputNameId : inpNameId,
			    },
				success: function(data) {

					if(jQuery('#labelOk').hasClass('visible')){

		    			jQuery("#labelOk").show();
		        		jQuery("#labelOk").fadeOut("slow");
		    		}
					else{

						jQuery("#labelOk").addClass('visible');
			    		jQuery("#labelOk").fadeOut("slow");
					}

			    },
			});
			await sleep(500);
		    //getResult(info[0]+ '/' + info[1] + '/');
		});
		
// 			***************************isallowToOwnr*******************	
		$('#myTable label[id=isAllowToOwner]').click(async function() {
			var faultIdcik = $(this).prev().attr('name');
			$.ajax({
			    type: 'POST',
			    url: '${pageContext.request.contextPath}/isAllowToOwner',
			    data: {
			    	faultId : faultIdcik,
			    },
				success: function(data) {

					if(jQuery('#labelOk').hasClass('visible')){

		    			jQuery("#labelOk").show();
		        		jQuery("#labelOk").fadeOut("slow");
		    		}
					else{

						jQuery("#labelOk").addClass('visible');
			    		jQuery("#labelOk").fadeOut("slow");
					}

			    },
			});
			await sleep(500);
		    //getResult(info[0]+ '/' + info[1] + '/');
		});
		
		
//     	***************************santral seçilince gesleri çekme*******************table-analyze santralSecimi addFaultTable
// 		$('.faultCentralClass').on('change', function() {
// 			alert($( ".faultCentralClass option:selected" ).val());
// 		    var selectedCentralId = $( ".faultCentralClass option:selected" ).val();
// 		    $.ajax({
// 		        url: '${pageContext.request.contextPath}/getinpNames',
// 		        type: 'POST',
// 		        dataType: 'text',
// 		        data: {
// 		            centralId: selectedCentralId
// 		        },
// 		        success: function(data) {
// 		        	$('#faultCihazID').append('<option value="1">asdasd</option>');
// 		        	alert("succesdeyim 1");
// 		        	$("select").selectpicker("refresh");
		        	
// 		        	alert("succesdeyim 1");
// 		        	list = JSON.parse(data);
// 		        	alert("succesdeyim 2");
// 		        	for (var i in list){
// 		        		alert(i[0] + "  " + i[1]);
// 		        		//$(' #faultCihazClass ').appendChild('<option value=' + i[0] + '>' + i[1] + '</option>');
// 		        	}
// 		        	alert("succesdeyim 5");
// 		        },
// 		    });
// 		});	
    </script>
  </body>
</html>