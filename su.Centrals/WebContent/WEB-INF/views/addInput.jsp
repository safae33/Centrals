<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Santral Sorumlusu</title>

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
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.7/css/mdb.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>





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
  		height: 100vh;
  		padding-left: 100px;
  		transition: ease 0.5s; 
  		margin-top:12vh;
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

.faultsTable{
	width: 40vw;
	float: left;
	padding: 3vh;
	border-radius: 10px;
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

.responsive{
  		max-width: 15vw;
		height: 8vh;
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
  </style>
  
  
  <script type="text/javascript">
  function addDailyValuesSure(){
	  return confirm("BUGÜNE AİT VERİ GİRİŞİ TAMAMLANACAK. BUNUN GERİ DONÜŞÜ OLMAYACAK. YALNIZCA MERKEZ TARAFINDAN DEĞİŞTİRİLEBİLİNECEK. EMİN MİSİNİZ?");
  }
  
  function addFaultSure(){
	  return confirm("YENİ BİR ARIZA KAYDI OLUSUTURALACAK. BUNUN GERİ DONÜŞÜ OLMAYACAK. YALNIZCA MERKEZ TARAFINDAN DEGİŞTiRiLEBiLiNECEK. EMiN MiSiNiZ?");
  }
  
  function checkValues(){
	  
  }
  </script>
  </head>
  <body>
  	<div id="page-container" class="main-admin">
	  	<nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed w-100" style="z-index:3">
		  <div >
	  				<a href="#"><img class="responsive" src="https://i.postimg.cc/ZKWLNB0g/logo.png"></a> 
<!-- 	  				https://www.renpro.com.tr/wp-content/uploads/2018/03/logo1.png -->
	  			</div>
		    <ul class="navbar-nav ml-auto">
			    
		    	<li class="nav-item dropdown ets-right-0">
		       		<a class="nav-link btn btn-lg responsive resp-font-2" style="color:white;" href="${pageContext.request.contextPath}/addInput/${centralId}" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">Sayaç Verisi Ekleme
		       		<img src="https://www.knowyourcompliance.com/wp-content/uploads/2018/03/GDPR-Data-Protection-Policy-Template.png" class="img-fluid rounded-circle border user-profile">
		        	</a>
		      	</li>
				<li class="nav-item dropdown ets-right-0">
		       		<a class="nav-link btn btn-lg responsive resp-font-2" style="color:white;" href="${pageContext.request.contextPath}/arizaBildirimi" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">Arıza Kayıtları
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
  	<div class="main-body-content table-responsive w-98">
  	<c:if test="${showInputPage}">
  	<c:if test="${addinputReally}">
  	<c:if test="${!inputAlready}">
  		<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
    <fieldset>
        <legend class="font-weight-bold">SAYAC VERİLERİNİ YAZINIZ</legend>
        
        <form method="POST" action="${pageContext.request.contextPath}/addI/${centralId}">
            <table>
                <tr>
                    <th>Santral İsmi</th>
                    <th><div class="form-group p2" style="padding-left: 20%;">
				    <h1><span class="badge badge-success font-italic">${centralName}</span></h1>
				    </div></th>
                </tr>
                <c:forEach var="input" items="${inputNames}">
                
                <tr>
                    <th>${input}</th>
                    <td><input name="input" required type="text" class="form-control" placeholder="${input} için değeri giriniz..." aria-label="Recipient's username" aria-describedby="basic-addon2" /></td>
                </tr>
                </c:forEach>
                <tr>
                    <td/>
                    <td><button type="submit" class="btn btn-success" onclick="return addDailyValuesSure();">Kaydet</button></td>
                </tr>
                
            </table>
            <c:if test="${param.dataFaultCheck}">
            	<br>
            	<br>
<h1 class="text-center"><span class="badge badge-secondary font-italic"> LÜTFEN HATALI GİRİLEN ALANLARI DÜZELTİNİZ </span></h1>

							<div class="row">
								<div class="container">
									<div class="row">
										<a class="intro-banner-vdo-play-btn pinkBg">
											<i class="glyphicon glyphicon-play whiteText" aria-hidden="true"></i>
											<span class="ripple pinkBg"></span>
											<span class="ripple pinkBg"></span>
											<span class="ripple pinkBg"></span>
										</a>
									</div>
								</div>
							</div>
				
            
            </c:if>
        </form>
    </fieldset>
</div>
</c:if>


<c:if test="${inputAlready}">
	<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
	    <fieldset>
	        <legend class="font-weight-bold">SAYAÇ VERİLERİ GİRİLDİ</legend>
	            <table>
	                <tr>
	                    <th>Santral İsmi</th>
	                    <th><div class="form-group p2" style="padding-left: 20%;">
					    <h1><span class="badge badge-custom font-italic">${centralName}</span></h1>
					    </div></th>
	                </tr>
	                <c:forEach var="input" items="${inputs}">
	                <tr>
	                    <th>${input[0]}</th>
	                    <td><input name="input" type="text" class="form-control" disabled value="${input[1]}" aria-label="Recipient's username" aria-describedby="basic-addon2" /></td>
	                </tr>
	                </c:forEach>
					<tr><td/><th><p class="font-italic text-success"> Bugüne ait veri girişi yapıldı.</p></th></tr>
	                <tr>
	                </tr>
	            </table>
	    </fieldset>
	</div>
</c:if>
</c:if>
<!-- ******************************************************* ADD FAULT ******************************************************** -->
<c:if test="${addFaultForAdmin}">
 	
  		<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
    <fieldset>
        <legend><a class="resp-font-2"><span class="badge badge-light">ARIZA KAYDI OLUŞTURMA</span></a></legend>
        <form  action="addFaultForAdminPost" method="post">
            <table>
            	<tr>
                    <th>Arıza Tipi :</th>
                    <td>
                    	<select required name="faultType" class="selectpicker">
							<option value="0" disabled selected>Arıza Tipini Seçiniz...</option>
							<c:forEach var="faultType" items="${faultTypes}">
								<option value="${faultType[0]}" > ${faultType[1]} </option>
							</c:forEach>
							
						</select>
					</td>
                </tr>
                <tr>
                    <th>Arıza Olusan Cıhaz :</th>
                    <td>
                    	<select required id="faultCihazClass" name="inputNameId" class="selectpicker">
                    	<option value="0" disabled selected>Cıhazı Seçiniz...</option>
                    	<c:forEach var="device" items="${devices}">
								<option value="${device[0]}" > ${device[1]} </option>
							</c:forEach>
							<option value="0" > Tümü </option>
						</select>
					</td>
                </tr>
                <tr>
                    <th>Arıza Hakkında Detay Yazınız :</th>
                    <td>
                    	<textarea maxlength="500" required rows="4" cols="50" name="comments"></textarea>
					</td>
                </tr>
				<c:if test="${addFaultSuccess}"><tr><td/><th><p class="font-italic text-success">**Başarıyla Arıza Kaydı Oluşturuldu</p></th></tr></c:if>
				
                <tr>
                    <td></td>
                    <td><button type="submit" class="btn btn-success" onclick="return addFaultSure();">Ekle</button></td>
                </tr>
            </table>
         </form>
    </fieldset>
</div>

<hr>

<!-- ******************************************************* TÜM ARIZALARI LISTELE ******************************************************** -->
<div class="d-flex align-items-center justify-content-center w-90" style="background-color: #d6d6ff;">
	<div class="table-responsive bg-color" style="margin-top:5vh;">
				<div class="form-inline">
				    <div class="form-group w-25 p-2">
				        <input id="myInput" type="text" placeholder="Arama.." class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
				    </div>
				    <div class="form-group p2" style="padding-left: 15%;">
				    <h1><span class="badge badge-light">Santralde Oluşan Tüm Arızalar</span></h1>
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
<%-- 	  				<tr <c:if test="${!fault[4]}">style="background-color: grey;"</c:if> <c:if test="${fault[4]}"> <c:if test="${fault[5]}">class="bg-success"</c:if> <c:if test="${!fault[5]}">class="bg-danger"</c:if> </c:if>> --%>
 	  					<c:if test="${!fault[4]}"><tr style="background-color: grey;"></c:if>
 	  					<c:if test="${fault[4]}"><c:if test="${fault[5]}"><tr class="bg-success"></c:if><c:if test="${!fault[5]}"><tr class="bg-danger"></c:if></c:if>
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
	</div>	
</c:if>



</c:if>

<c:if test="${!showInputPage}">
<h1 class="text-center"><span class="badge badge-danger font-italic">YETKİSİZ ERİŞİM LÜTFEN GERİ DÖNÜNÜZ</span></h1>
</c:if>

  	</div>
</div>

</body>
</html>