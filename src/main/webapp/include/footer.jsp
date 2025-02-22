<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
		</main>
		<footer>
			<section class="last-message">
				<article class="my-pagination">
				</article>
				<article class="footer-msg">
					<span>It is jium Office, which knows your mind the best.</span>
				</article>
				<article class="excel-download">
					<%
						if(userId == null){
					%>
							로그인 하세요~
					<%
						}else{
					%>
							<span onclick="downloadExcel('all');">전체다운로드</span>
							<span onclick="downloadExcel('search-mode');">검색결과다운로드</span>
					<%	
						}
					%>
				</article>
			</section>
			<section class="footer-wrapper">
				<section class="footer-logo">
					<article>
						<a href="/">
							<img src="/images/source/footer_logo.png">
						</a>
					</article>
					<article>
						2023 - 2024
					</article>
				</section>
				<section class="company">
					<article>COMPANY</article>
					<article>
						회사명 : (주)세상종합물류
					</article>
					<article>
						대표 : 남궁정
					</article>
					<article>
						사업자번호 : 810-88-02820
					</article>
					<article>
						통신판매번호 : 제2023-부산사상구-0425호
					</article>
					<article>
						개인정보 보호 책임자 : 남궁정
					</article>
				</section>
				<section class="address">
					<article>Address</article>
					<article>주소 : 부산광역시 사상구 새벽로172, 1층(감전동 121-25)</article>
				</section>
				<section class="contact">
					<article>Contact us</article>
					<article>T. : 051-710-8103, 1644-8103</article>
					<article>F. : 051-711-8103</article>
					<article>E. : wmullyu@gmail.com</article>
				</section>
				<section class="family">
					<article>family site</article>
					<article>Maped</article>
				</section>
			</section>
		</footer>
		<script src="https://kit.fontawesome.com/99f7b4874c.js" crossorigin="anonymous"></script>
		<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script> -->
		<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script> -->
		<script src="https://unpkg.com/@popperjs/core@2"></script>
		<script src="/script/js/bootstrap.min.js"></script>
		<script src="/script/rect.js"></script>
		<script src="/script/main.js"></script>
		<script src="/script/leftSection.js"></script>
		<script src="/script/currentMoney.js"></script>
		<script src="/script/loginForm.js"></script>
		<script src="/script/category.js"></script>
		<script src="/script/brand.js"></script>
		<script src="/script/itemExposure.js"></script>
		<script src="/script/search.js"></script>
		<script src="/script/itemCnt.js"></script>
		<script src="/script/calendar.js"></script>
		<script src="/script/imgScrollData.js"></script>
		<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
		<script type="text/javascript">
			if(!wcs_add) var wcs_add = {};
			wcs_add["wa"] = "64e418b807373";
			if(window.wcs) {
			  wcs_do();
			}
			document.addEventListener('DOMContentLoaded', function() {
			    const leftSection = document.querySelector('.leftSection');
			    const innerRight = document.querySelector('.innerRight');
			    const arrowIcon = document.querySelector('.innerRight i');

			    innerRight.addEventListener('click', function() {
			        // 현재 left 값 확인
			        const currentLeft = parseInt(window.getComputedStyle(leftSection).left);
			        
			        if (currentLeft === 0) {
			            // 왼쪽으로 들어가기
			            leftSection.style.left = '-285px';
			            // 아이콘 변경
			            arrowIcon.classList.remove('fa-chevron-left');
			            arrowIcon.classList.add('fa-chevron-right');
			        } else {
			            // 왼쪽에서 나오기
			            leftSection.style.left = '0';
			            // 아이콘 변경
			            arrowIcon.classList.remove('fa-chevron-right');
			            arrowIcon.classList.add('fa-chevron-left');
			        }
			    });
			});
		</script>
	</body>
</html>