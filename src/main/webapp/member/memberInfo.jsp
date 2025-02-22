<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
    if (request.getProtocol().equals("HTTP/1.1")){
        response.setHeader("Cache-Control", "no-cache");
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%!
	public String[] getPhoneNumber(String number){
		int numLen = number.length();
		String setCompanyPhone[] = new String[3];
		String seoulNumber = number.substring(0, 2);
		if(seoulNumber.equals("02")){
			setCompanyPhone[0] = seoulNumber;
			if(numLen == 9){
				setCompanyPhone[1] = number.substring(2,5);
				setCompanyPhone[2] = number.substring(5,numLen);
			}else{
				setCompanyPhone[1] = number.substring(2,6);
				setCompanyPhone[2] = number.substring(6,numLen);
			}
		}else{
			setCompanyPhone[0] = number.substring(0, 3);
			if(numLen == 10){
				setCompanyPhone[1] = number.substring(3,6);
				setCompanyPhone[2] = number.substring(6,numLen);
			}else{
				setCompanyPhone[1] = number.substring(3,7);
				setCompanyPhone[2] = number.substring(7,numLen);
			}
		}
		return setCompanyPhone;
	}

	public String[] getCompanyRegistrationNumber(String number){
		String setRegistration[] = new String[3];
		setRegistration[0] = number.substring(0, 3);
		setRegistration[1] = number.substring(3, 5);
		setRegistration[2] = number.substring(5, 10);
		return setRegistration;
	}
%>
<%@ include file="/include/top.jsp"%>
	<%
		if(userId != null){
	%>
			<section class="mainLogged">
				<section class="member-title main-layout-width">
					<span>MEMBER INFORMATION</span> <span class="member-title-name">[<%=companyName%>, <%=userId%>]</span>
				</section>
				<section class="member-info-list main-layout-width">
					<%
						String userMail = (String)session.getAttribute("userMail");
						String companyRegistrationNumber = (String)session.getAttribute("companyRegistrationNumber");
						String companyPhone = (String)session.getAttribute("companyPhone");
						String companyFAX = (String)session.getAttribute("companyFAX");
						String userCellphone = (String)session.getAttribute("userCellphone");
						String companyZipcode = (String)session.getAttribute("companyZipcode");
						String companyAddress_1 = (String)session.getAttribute("companyAddress_1");
						String companyAddress_2 = (String)session.getAttribute("companyAddress_2");
						String registrationDate = (String)session.getAttribute("registrationDate");
						String modifyDate = (String)session.getAttribute("modifyDate");
					%>
					<form method="post" class="memberForm">
						<section>
							<article>아이디</article>
							<article><input type="text" value="<%=userId%>" name="userId" class="userId" readonly></article>
						</section>
						<section>
							<article>비밀번호</article>
							<article id="changeBtnWrapper">
								<input type="password" name="userPw" class="userPw" placeholder="비밀번호를 입력하세요">
								<input type="password" name="newPassword" class="newPassword" placeholder="새로운 비밀번호를 입력하세요">
								<input type="password" name="newPasswordRe" class="newPasswordRe" placeholder="다시한번 입력하세요">
								<input type="button" value="비밀번호변경" class="changePwd">
							</article>
						</section>
						<section>
							<article>이메일</article>
							<article><input type="email" value="<%=userMail%>" required></article>
						</section>
						<section>
							<article>회사명</article>
							<article><input type="text" value="<%=companyName%>" required></article>
						</section>
						<section>
							<article>사업자번호</article>
							<article class="input-collection">
								<%
									String getCompanyRegNumber[] = getCompanyRegistrationNumber(companyRegistrationNumber);
								%>
								<div><input type="text" value="<%=getCompanyRegNumber[0]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getCompanyRegNumber[1]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getCompanyRegNumber[2]%>"></div>
							</article>
						</section>
						<section>
							<article>전화번호</article>
							<article class="input-collection">
								<%
									String getNumber[] = getPhoneNumber(companyPhone);
								%>
								<div><input type="text" value="<%=getNumber[0]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getNumber[1]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getNumber[2]%>"></div>
							</article>
						</section>
						<section>
							<article>FAX번호</article>
							<article class="input-collection">
								<%
									String getFaxNumber[] = getPhoneNumber(companyFAX);
								%>
								<div><input type="text" value="<%=getFaxNumber[0]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getFaxNumber[1]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getFaxNumber[2]%>"></div>
							</article>
						</section>
						<section>
							<article>휴대폰번호</article>
							<article class="input-collection">
								<%
									String getUserCellphone[] = getPhoneNumber(userCellphone);
								%>
								<div><input type="text" value="<%=getUserCellphone[0]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getUserCellphone[1]%>"></div>
								<div>-</div>
								<div><input type="text" value="<%=getUserCellphone[2]%>"></div>
							</article>
						</section>
						<section>
							<article>우편번호</article>
							<article id="changeBtnWrapper"><input type="text" value="<%=companyZipcode%>" readonly><input type="button" value="주소변경" class="changeAddr" onclick="setAddr();"></article>
						</section>
						<section>
							<article>주소</article>
							<article><input type="text" value="<%=companyAddress_1%>" readonly></article>
						</section>
						<section>
							<article>나머지주소</article>
							<article><input type="text" value="<%=companyAddress_2%>"></article>
						</section>
						
						<script>
							function setAddr(){
								new daum.Postcode({
							        oncomplete: function(data) {
							        	var roadAddr = data.roadAddress;
							        	var zonecode = data.zonecode;
							        	console.log(zonecode, roadAddr);
							        }
							    }).open();
							}
						</script>
						
						<section>
							<article>등록일</article>
							<article><input type="text" value="<%=registrationDate%>" readonly></article>
						</section>
						<section>
							<article>수정일</article>
							<article><input type="text" value="<%=modifyDate%>" readonly></article>
						</section>
						<section id="memberBtns">
							<article><input type="button" value="전 송" class="btnSubmit"></article>
							<article><input type="button" value="재입력" onclick="fnReset(this.form);"></article>
							<article><input type="button" value="취 소" onclick="fnCancel();" class="btnCancel"></article>
						</section>
					</form>
				</section>
			</section>
			<script src="/script/member.js"></script>
	<%
		}else{
			response.sendRedirect("/index.jsp");
		}
	%>
<%@ include file="/include/footer.jsp"%>