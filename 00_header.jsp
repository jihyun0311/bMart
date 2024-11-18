<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String log = (String)session.getAttribute("log");	
	%>	
	
    <div class="container">
        <div class="d-flex justify-content-xl-end justify-content-center">
            <ul class="nav">
            	<% if(log == null) { %>
	                <li class="nav-item"><a href="_01_login.jsp" class="nav-link" style="color: black">로그인</a></li>
	                <li class="nav-item"><a href="_12_joinForm.jsp" class="nav-link" style="color: black">회원가입</a></li>
	                <li class="nav-item"><a href="#" class="nav-link" style="color: black">고객센터</a></li>
                <% } else { %>
                	<li class="nav-item"><a class="nav-link"><%= log %>님, 로그인 중</a></li>
                	<li class="nav-item"><a href="_04_logout.jsp" class="nav-link">로그아웃</a></li>
                	<li class="nav-item"><a href="07_cartList.jsp" class="nav-link">장바구니</a></li>
	                <li class="nav-item"><a href="#" class="nav-link">고객센터</a></li>
                <% } %>
            </ul>
        </div>
    </div>
    
    <div class="container">   
        <div class="d-flex justify-content-xl-center justify-content-center">
            <a href="04_itemList.jsp">
                <img alt="팀플" src="이미지/logo3.png" class="img-fluid" width="150px">
            </a>
        </div>
    </div>   

    <nav class="navbar navbar-expand-xl bg-light">
        <div class="container">
            <button   
                class="navbar-toggler" 
                type="button" 
                data-bs-toggle="collapse" 
                data-bs-target="#header-nav"        
            >
            <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="header-nav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">전체메뉴</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">정육-가공육-계란</a></li>
                            <li><a class="dropdown-item" href="#">채소</a></li>
                            <li><a class="dropdown-item" href="#">생활용품-리빙</a></li>
                            <li><a class="dropdown-item" href="#">과일-견과-쌀</a></li>
                            <li><a class="dropdown-item" href="#">이주의 특가</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link"  href="">신상품</a></li>
                    <li class="nav-item"><a class="nav-link" href="">오늘의 특가</a></li>
                    <li class="nav-item"><a class="nav-link" href="">날짜 임박 할인</a></li>
                 
                    
                </ul>

                <ul class="nav">
                  <div class="input-group">
                      <input type="text" class="form-control" placeholder="상품을 입력하세요." style="width: 200px;">
                      <button type="submit" class="btn" style="background-color: red; color: white">검색</button>
                  </div>
                </ul>
            </div>       
        </div>
    </nav>
    
    <hr>
    