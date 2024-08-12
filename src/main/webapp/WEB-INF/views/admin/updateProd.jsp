<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
상품수정

	${PDTO.product_code}
	<div align="center">

    <!-- 상품 수정 폼 -->
    <form name="updateForm" action="/admin/updateProdOk.do" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="hidden" name="product_code" value="${PDTO.product_code}">
        <table>
            <tr>
                <td><label for="product_name">상품 이름 :</label>
                    <input type="text" name="product_name" id="product_name" value="${PDTO.product_name}"></td>
            </tr>
            <tr>
                <td>
                    <label for="product_image">상품 이미지 :</label>
                    <c:choose>
                        <c:when test="${not empty PDTO.product_image}">
                            <img src="${pageContext.request.contextPath}/img/${PDTO.product_image}" alt="상품 이미지" style="max-width: 200px;"/>
                        </c:when>
                        <c:otherwise>
                            <span>현재 사진 없음</span>
                        </c:otherwise>
                    </c:choose>
                    <input type="file" name="file" id="product_image" />
                </td>
            </tr>
            <tr>
                <td><label for="base_rate">기본 금리 :</label>
                    <input type="text" name="base_rate" id="base_rate" placeholder="소수점 두 자리까지 입력 가능" value="${PDTO.base_rate}"></td>
            </tr>
            <tr>
                <td><label for="goldenball_rate">골든볼 금리 :</label>
                    <input type="text" name="goldenball_rate" id="goldenball_rate" placeholder="소수점 두 자리까지 입력 가능" value="${PDTO.goldenball_rate}"></td>
            </tr>
            <tr>
                <td><label for="subscription_method">정기결제 방법 :</label>
                    <select name="subscription_method">
                        <option value="매일" <c:if test="${PDTO.subscription_method == '매일'}">selected</c:if>>매일</option>
                        <option value="매주" <c:if test="${PDTO.subscription_method == '매주'}">selected</c:if>>매주</option>
                        <option value="매달" <c:if test="${PDTO.subscription_method == '매달'}">selected</c:if>>매달</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="subscription_period">가입 기간 :</label>
                    <select name="subscription_period">
                        <option value="1개월" <c:if test="${PDTO.subscription_period == '1개월'}">selected</c:if>>1개월</option>
                        <option value="3개월" <c:if test="${PDTO.subscription_period == '3개월'}">selected</c:if>>3개월</option>
                        <option value="6개월" <c:if test="${PDTO.subscription_period == '6개월'}">selected</c:if>>6개월</option>
                        <option value="1년" <c:if test="${PDTO.subscription_period == '1년'}">selected</c:if>>1년</option>
                    </select>
                </td>
            </tr>
            <!-- <tr>
                <td><label for="accumulated_amount">누적 금액 :</label>     
                    <input type="text" name="accumulated_amount" id="accumulated_amount"></td>
            </tr> --> 
            <tr>
                <td><label for="termination_conditions">해지 조건 :</label>
                <textarea name="termination_conditions" id="termination_conditions" placeholder="상품 해지 조건">${PDTO.termination_conditions}</textarea>
                </td>
            </tr>
            <tr>
                <td><label for="early_fee">중도 포기 수수료 :</label>
                <input type="text" name="early_fee" id="early_fee" placeholder="소수점 두 자리까지 입력 가능" value="${PDTO.early_fee}"></td>
            </tr>
            <tr>
                <td><label for="minimum_deposit">최소 금액 :</label>
                <input type="text" name="minimum_deposit" id="minimum_deposit" placeholder="소수점 두 자리까지 입력 가능" value="${PDTO.minimum_deposit}"></td>
            </tr>
            <tr>
                <td><label for="maximum_deposit">최대 금액 :</label>
                <input type="text" name="maximum_deposit" id="maximum_deposit" placeholder="소수점 두 자리까지 입력 가능" value="${PDTO.maximum_deposit}"></td>
            </tr>
            <tr>
                <td><label for="start_date">상품 시작일 :</label>
                <input type="date" id="start_date" name="start_date" value="${PDTO.start_date}"></td>
            </tr>
            <tr>
                <td><label for="product_status">상품 상태 :</label>
                    <select name="product_status">
                        <option value="활성" <c:if test="${PDTO.product_status == '활성'}">selected</c:if>>활성</option>
                        <option value="비활성" <c:if test="${PDTO.product_status == '비활성'}">selected</c:if>>비활성</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="product_description">상품 설명 :</label>
                <textarea name="product_description" id="product_description" placeholder="상품 설명">${PDTO.product_description}</textarea>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="submit" value="수정">
                </td>
            </tr>
        </table>
    </form>

    <!-- 상품 삭제 폼 -->
    <form name="deleteForm" action="/admin/deleteProd.do" method="POST" onsubmit="return confirm('정말로 이 상품을 삭제하시겠습니까?');">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="hidden" name="product_code" value="${PDTO.product_code}">
        <div align="center">
            <input type="submit" value="삭제" style="color: red;">
        </div>
    </form>

	</div>

<jsp:include page="../footer.jsp"/>