<%@page import="com.togedog.vo.ParamDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Togedog</title>

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.png">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- css  -->
<link rel="stylesheet" href="css/signup.css">

<!-- 타임피커 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<style>
	#fullBackground 
    {
        position: absolute;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 200%;
        background-color: black;
        filter: alpha(opacity = 55);
        opacity: 0.5;
        display: none;
        z-index: 100;
    }
   
    #popup 
    {
        position: absolute;
        left: 100px;
        top: 100px;
        z-index: 200;
        display: none;
    }

	.password 
	{
		width: 250px;
	}
	
	.check 
	{
		width: 100px;
		height: 25px;
		padding: 0.1em 0.5em 0.1em 0.5em;
		letter-spacing: 0.05em;
		border-radius: 5px;
		box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
			rgba(0, 0, 0, 0.19);
		font-size: 13px;
	}
	
	.find 
	{
		width: 100px;
		height: 25px;
		padding: 0.1em 0.5em 0.1em 0.5em;
		letter-spacing: 0.05em;
		border-radius: 5px;
		box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0
			rgba(0, 0, 0, 0.19);
		font-size: 13px;
	}
	
	.form-control 
	{
		width: 180px;
		height: 25px;
		font-size: 12px;
	}
	
	.time 
	{
		width: 100px;
	}
	
	body 
	{
		margin: 0;
		padding: 0;
	}
</style>
</head>
<body>
	<div id='fullBackground'></div>

	<c:import url="HeaderLogin.jsp"></c:import>

	<div class="col-md-12" style="margin-top: 40px; margin-bottom: 60px; border-bottom: 1px solid #DEDEDE;">
		<span style="text-align: center; font-size: 30px; font-weight: bold; color: #75C3F8;">산책대행 매칭정보 등록</span>
	</div>
	<br><br>

	<div class="container" style="text-align: left; line-height: 20px;">	
		<div class="row">
			<div class="col-sm-12" style="line-height: 30px; text-align: center;">
				<img src="images/FOOT.png" style="width: 20px; height: 17px;">&nbsp;
				<span style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">서비스 이용안내</span>
				&nbsp;<img src="images/FOOT.png" style="width: 20px; height: 17px;">
			</div><br><br>
		</div>
		
		<div class="row">
			<div class="col-sm-3" style="line-height: 30px; text-align: center;"></div>
			<div class="col-sm-7" style="line-height: 25px; font-size: 13px;color: #666666;">
				<span style="font-size: 20px; font-weight: bold; color: #75C3F8;">Step1. </span>
				<span style="font-size: 15px; font-weight: bold; color: #828282;">산책대행 매칭정보 등록</span><br>
				&nbsp;&nbsp;산책대행 서비스 이용을 위해 기초 정보를 등록합니다.<br><br>
				<span style="font-size: 20px; font-weight: bold; color: #75C3F8;">Step2. </span>
				<span style="font-size: 15px; font-weight: bold; color: #828282;">워커님의 매칭신청 수락</span><br>
				&nbsp;&nbsp;맞춤 추천된 워커님의 매칭 신청을 수락합니다.<br>
				&nbsp;&nbsp;(한 산책대행 당 한 분과의 매칭만 가능합니다.)<br><br>
				<span style="font-size: 20px; font-weight: bold; color: #75C3F8;">Step3. </span>
				<span style="font-size: 15px; font-weight: bold; color: #828282;">인계증 작성 및 요금 결제</span><br>
				&nbsp;&nbsp;매칭신청 수락 이후, 인계증을 작성하여 워커님께 전달하셔야 최종 매칭완료가 가능합니다.<br>
				&nbsp;&nbsp;※ 성실하게 작성하지 않을 시 불이익은 책임지지 않습니다.<br><br>
				<span style="font-size: 20px; font-weight: bold; color: #75C3F8;">Step4. </span>
				<span style="font-size: 15px; font-weight: bold; color: #828282;">최종 매칭완료</span><br>
				&nbsp;&nbsp;산책시작 시간에 맞추어 픽업 장소에서 워커님께 반려견을 인계합니다.<br><br>
				<span style="font-size: 20px; font-weight: bold; color: #75C3F8;">Step5. </span>
				<span style="font-size: 15px; font-weight: bold; color: #828282;">산책대행 완료</span><br>
				&nbsp;&nbsp;산책 이후 워커님께서 작성해주시는 대행 기록을 마이어리에서 확인해보세요.<br><br><br><br>
			</div><br><br>
		</div>
	
		<form id="myForm" action="agencymatchinsertcomp.action">
			<div class="container" style="text-align: left; line-height: 20px;">
				<div class="row">
					<div class="col-sm-1" style="line-height: 30px;"></div>
					<div class="col-sm-4" style="line-height: 30px; text-align: left;">
						<img src="images/FOOT.png" style="width: 30px; height: 27px;">
						&nbsp;&nbsp;&nbsp;
						<span style="color: #828282; font-size: 15px;">산책할 날짜 및 시간을 선택해주세요.</span>
					</div>
				</div>
				<br><br>
		
				
			<div class="row">
				<div class="col-sm-2" style="line-height: 30px;"></div>
				<div class="col-sm-10" style="line-height: 30px; text-align: left;">
					<div id="timedropper">
						<div class="col-sm-1">
							<span style="text-align: center; font-size: 12px; color: #828282;">날짜선택</span>
						</div>
						<div class="col-sm-3">
							<input id="fromDate" name="fromDate" class="form-control time" required="required">
						</div>
						<div class="col-sm-1">
							<span style="text-align: center; font-size: 12px; color: #828282;">시작시간</span>
						</div>
						<div class="col-sm-3">
							<select id="startTime" name="startTime" class="form-control time" required="required">
								<c:forEach var="i" begin="0" end="23">
									<option value="${i }:00">${i } : 00</option>
									<option value="${i }:30">${i } : 30</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-1">
							<span style="text-align: center; font-size: 12px; color: #828282;">종료시간</span>
						</div>
						<div class="col-sm-3">
							<select id="endTime" name="endTime" class="form-control time" required="required">
								<c:forEach var="i" begin="0" end="23">
									<option value="${i }:00">${i } : 00</option>
									<option value="${i }:30">${i } : 30</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<br><br>
		
			<div class="container">
				<div class="row">
					<div class="col-sm-1" style="line-height: 30px;"></div>
					<div class="col-sm-4" style="line-height: 30px; text-align: left;">
						<img src="images/FOOT.png" style="width: 30px; height: 27px;">
						&nbsp;&nbsp;&nbsp;
						<span style="color: #828282; font-size: 15px;">산책할 반려견을 선택해주세요.</span>
					</div>
				</div>
			
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-11" style="line-height: 30px; text-align: left; width: 80%;">
					<c:import url="PetSel.jsp"></c:import>
				</div>
			</div>
			<br><br>
			
			<div class="row">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-4" style="line-height: 30px; text-align: left;">
					<img src="images/FOOT.png" style="width: 30px; height: 27px;">
					&nbsp;&nbsp;&nbsp;
					<span style="color: #828282; font-size: 15px;">장소를 선택해주세요</span>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-10">
					<div class="col-sm-2">
						<span style="text-align: center; font-size: 12px; color: #828282;">주소</span>
					</div>
					<div class="col-sm-3">
						<select name="addrSel1" id="addrSel1" class="form-control" required="required">
							<option>시·도 선택</option>
							<c:forEach var="addr1" items="${sdList }">
								<c:choose>
									<c:when test="${addr1.addrCd1 == ownInfo.addrCd1 }">
										<option value="${addr1.addrCd1 }" selected="selected">${addr1.addr1 }</option>
									</c:when>
									<c:otherwise>
										<option value="${addr1.addrCd1 }">${addr1.addr1 }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-3">
						<select name="addrSel2" id="addrSel2" class="form-control" required="required">
							<option>시·군·구 선택</option>
							<c:forEach var="addr2" items="${sggList }">
								<c:choose>
									<c:when test="${addr2.addrCd2 == ownInfo.addrCd2 }">
										<option value="${addr2.addrCd2 }" selected="selected">${addr2.addr2 }</option>
									</c:when>
									<c:otherwise>
										<option value="${addr2.addrCd2 }">${addr2.addr2 }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-3">
						<select name="addrSel3" id="addrSel3" class="form-control" required="required">
							<option>동·읍·면 선택</option>
							<c:forEach var="addr3" items="${demList }">
								<c:choose>
									<c:when test="${addr3.addrCd3 == ownInfo.addrCd3 }">
										<option value="${addr3.addrCd3 }" selected="selected">${addr3.addr3 }</option>
									</c:when>
									<c:otherwise>
										<option value="${addr3.addrCd3 }">${addr3.addr3 }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 2%;">
				<div class="col-lg-2"></div>
				<div class="col-lg-10">
					<div class="col-sm-2">
						<span style="text-align: center; font-size: 12px; color: #828282;">상세주소</span>
					</div>
					<div class="col-sm-9">
						<input type="text" name="addrDetail" id="addrDetail" class="form-control" required="required" style="width: 96%;">
					</div>
				</div>
			</div>
		</div>
			<br><br>
			
			<div class="row" id="accountX">
				<div class="col-sm-1" style="line-height: 30px;"></div>
				<div class="col-sm-4" style="line-height: 30px; text-align: left;">
					<img src="images/FOOT.png" style="width: 30px; height: 27px;">
					&nbsp;&nbsp;&nbsp;
					<span style="color: #828282; font-size: 15px;">환불시 입금 계좌를 등록해주세요.</span>
				</div>
			</div>
			<br>
			
			<div class="row" id="accountO">
				<div class="col-sm-2" style="line-height: 30px;"></div>
				<div class="col-sm-7" style="line-height: 30px; text-align: left;">
					<div class="row">
						<div class="col-sm-3" style="line-height: 30px; text-align: left;">
							<span style="color: #828282; font-size: 15px;">정산 계좌 정보</span>
						</div>
						<div class="col-sm-3" style="line-height: 28px;">
							<select class="form-control" name="interest" style="font-size: small; width: 120px; height: 30px;">
								<c:forEach var="dto" items="${bankList }">
									<option value="${dto.bankCd }">${dto.bank }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-6" style="line-height: 30px;">
							<input type="text" class="form-control" id="accNum" name="accNum" style="width: 200px; height: 30px;" placeholder="-없이 계좌번호 입력" required="required">
						</div>
					</div>
					
					
					<div class="row">
						<span id="space" style="line-height: 8px;">&nbsp;</span>
					</div>
			
					<div class="row">
						<div class="col-sm-1" style="line-height: 15px;"></div>
						<div class="col-sm-2" style="line-height: 15px; text-align: left;"></div>
						<div class="col-sm-9" style="line-height: 15px;">
							<span style="color: #828282; font-size: 12px;">
							※ 반드시 예금주가 <span style="color: red;">본인 명의</span>인 계좌를 입력해주세요.<br> 
							&nbsp;&nbsp;&nbsp; 그렇지 않을 경우 정산시 문제가 발생할 수 있습니다.
							</span>
						</div>
					</div>
				</div>
			</div>
		</form>
		<br><br>
		
		<div class="row">
			<div class="col-sm-12" style="line-height: 30px; text-align: center;">
				<img src="images/FOOT.png" style="width: 20px; height: 17px;">&nbsp;
				<span style="text-align: center; font-size: 16px; font-weight: bold; color: #828282;">가격정책</span>
				&nbsp;<img src="images/FOOT.png" style="width: 20px; height: 17px;">
			</div><br><br>
		</div>
		
		<div class="row" align="center">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-10" style="line-height: 30px;">
				<table class="table table-bordered" id="rate"
				style="font-size: 13px; text-align: center; width: 80%;">
					<tr>
						<th style="text-align: center; width: 140px; background-color: #E0E0E0;">산책시간 / 펫사이즈</th>
						<%	
							
							List<ParamDTO> petSizeList = (List)request.getAttribute("petSizeList");
							for(int i = 0; i < petSizeList.size() - 1; i++)
								out.write(String.format("<th style='text-align: center; background-color: #E0E0E0;'>%s(%d ~ %dkg)</th>", petSizeList.get(i).getItem(), petSizeList.get(i).getWeight(), petSizeList.get(i + 1).getWeight() - 1));
							out.write(String.format("<th style='text-align: center; background-color: #E0E0E0;'>%s(%dkg ~)</th>", petSizeList.get(petSizeList.size() - 1).getItem(), petSizeList.get(petSizeList.size() - 1).getWeight()));
						%>
					</tr>
					<%
						List<ParamDTO> agcBasePrice = (List)request.getAttribute("agcBasePrice");
						List<ParamDTO> agcSubPrice = (List)request.getAttribute("agcSubPrice");
						
						for(int i = 0; i < agcBasePrice.size(); i++)
						{
							out.write("<tr>");
							out.write("<th style='text-align: center; background-color: #E0E0E0;'>" + agcBasePrice.get(i).getItem() + "</th>");
							out.write("<td>" + agcBasePrice.get(i).getPrice() + "￦</td>");
							
							for(int j = 0; j < agcSubPrice.size(); j++)
								out.write("<td>" + (agcBasePrice.get(i).getPrice() + agcSubPrice.get(j).getPrice()) + "￦</td>");
							out.write("</tr>");
						}
					%>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-2" style="line-height: 30px;"></div>
			<div class="col-sm-9" style="line-height: 25px; text-align: left; font-size: 13px; font-weight: bold; color: #666666;">
				- 반려견 마리당 기본추가금 : 3000원<br>
				<c:forEach var="dto" items="${agcSubPrice }">
					- ${dto.item } : 기본추가금 + ${dto.price }원<br>
				</c:forEach>
			</div>
		</div>
		<br><br>
		
		<div class="row">
			<div class="col-sm-1" style="line-height: 30px;"></div>
			<div class="col-sm-11" style="line-height: 30px; text-align: center;">
				<button type="button" class="btn" onclick="sendIt()">정보등록</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn" id="cancel" name="cancel" style="background-color: #828282;">취소하기</button>
			</div>
		</div>
		<br><br>
	</div>

	<c:import url="FooterWeb.jsp"></c:import>
	
	<div id="popup">
    	<div class="modal-content">
	      	<div class="modal-header">
		      	<div class="titleBar">
		            <div class="title">산책 등록</div>
		         </div>
	      	</div>
	      	
 	      	<div class="col-sm-12" style="line-height: 30px; text-align: center;">
				<span style="color: #595959; font-size: 15px; font-weight: bold;">입력하신 정보로 산책매칭 정보를 등록하시겠습니까?</span>
				<br>
				<span style="color: #595959; font-size: 11px;">※ 입력된 정보와 다른 사실이 있을 경우 불이익을 받을 수 있으니 유의하세요.</span>
			</div>   
         
	        <div class="modal-footer">
	        	<div class="col-sm-12" style="text-align: center;">
					<button type="submit" class="btn" id="matchingGo" name="matchingGo"
					style="width: 90px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
					border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
					font-size: 13px;">OK</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn" id="cancel" name="cancel" style="background-color: #828282;
					width: 90px; height: 35px; padding: 0.1em 0.5em 0.1em 0.5em; letter-spacing: 0.05em;
					border-radius: 5px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 3px 7px 0 rgba(0, 0, 0, 0.19);
					font-size: 13px;">Cancel</button>
				</div>
	        </div>
      	</div>
   	</div>
</body>
<script>
	var on_off = 0;
	var x_margin, y_margin;
	var popup, fullBackground; 
	
	$(document).ready(function() 
	{	
		$("#fromDate").datepicker(
		{
			dateFormat: 'yy-mm-dd', //Input Display Format 변경
            showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            showMonthAfterYear:true, //년도 먼저 나오고, 뒤에 월 표시
            changeYear: true, //콤보박스에서 년 선택 가능
            changeMonth: true, //콤보박스에서 월 선택 가능                
            buttonText: "생년월일", //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            yearSuffix: "년", //달력의 년도 부분 뒤에 붙는 텍스트
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'], //달력의 월 부분 텍스트
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip 텍스트
            dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 부분 텍스트
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일 부분 Tooltip 텍스트
            minDate: "+1D", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            maxDate: "+14D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
         });                    
		
		//초기값을 오늘 날짜로 설정
		$('#fromDate').datepicker('setDate', 'today');
		
		$(document).on("click", "#cancel", function()
		{
			closeFrame();
		});
		
		$(document).on("click", "#matchingGo", function()
		{
			$("#myForm").submit();
		});

		// 시도 변경 시 
	    $("#addrSel1").change(function()
	    {
	    	var addrSel1 = $("#addrSel1").val();
	         
	        $.ajax(
	        {
	           type : 'GET',
	           data :
	           {
	              addrSel1 : addrSel1
	           },
	           url : "getsgglist.action",
	           success : function(data)
	           {  
	              $("#addrSel2").html(data);
	           }
	        });// end ajax 
	    });   
	       
	    $("#addrSel2").change(function()
	    {
	    	var addrSel2 = $("#addrSel2").val();
	         
	        $.ajax(
	        {
	           type : 'GET',
	           data :
	           {
	              addrSel2 : addrSel2
	           },
	           url : "getdemlist.action",
	           success : function(data)
	           {              
	              $("#addrSel3").html(data);
	           }
	        });// end ajax
	  	});   
	});
	
	function sendIt()
	{
		var startTime = document.getElementById("startTime").value.split(":");
		var endTime = document.getElementById("endTime").value.split(":");
			
		if(Number(startTime[0]) > Number(endTime[0]))
		{
			alert("시작시간이 더 클 수 없습니다");
			return;
		}
		else if(startTime[0] == endTime[0])
			if(Number(startTime[1]) >= Number(endTime[1]))
			{
				alert("시작시간이 더 클 수 없습니다");
				return;
			}
		
		if(!$("input:checkbox[name=petSel]").is(":checked"))
		{
			alert("산책할 강아지 선택");
			return;
		}
		
		if(!$("input:radio[name=petRep]").is(":checked"))
		{
			alert("대표 강아지 선택");
			return;
		}
		
		openFrame();
	}
 
    function openFrame() 
    {
        popup = document.getElementById("popup");
        fullBackground = document.getElementById("fullBackground"); 

        fullBackground.style.top = document.body.scrollTop; 
        fullBackground.style.left = document.body.scrollLeft;

        popup.style.top = ((screen.height / 2) - 300 + document.body.scrollTop)   + "px";
        popup.style.left = ((screen.width / 2) - 200) + "px";
 
        fullBackground.style.display = "block";
        popup.style.display = "block";
        document.body.style.overflow = "hidden";
       
        window.scrollTo(0, 0);
    }

    function closeFrame() 
    {
    	popup = document.getElementById("popup");
        fullBackground = document.getElementById("fullBackground"); 
 	
        fullBackground.style.display = "none";
        popup.style.display = "none";
        document.body.style.overflow = "auto";
    }
</script>
</html>