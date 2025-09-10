<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>스프링 부트 - 게시판 실습</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
                crossorigin="anonymous">
        </head>

        <body>

            <div class="container mt-5">
                <h2>스프링부트 - 게시판 실습</h2>
                <div class="card">
                    <div class="card-header">
                        게시판
                    </div>
                    <div class="p-4">
                        <div class="mb-3 d-flex justify-content-end">
                            <form class="d-flex gap-2 w-25" name="searchForm">
                                <input class="form-control" type="text" name="search">
                                <input class="btn btn-primary" type="button" name="searchBtn" value="검색">
                            </form>
                        </div>
                        <table class="table table-bordered table-hover m-0">
                            <thead class="table-light">
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 
                                    list 출력하기
                                    - list 데이터가 없는 경우 '현재 작성된 게시글이 존재하지 않습니다.' 메시지 출력하기  
                                -->
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="4" align="center">
                                            현재 작성된 게시글이 존재하지 않습니다.
                                        </td>
                                    </tr>
                                </c:if>

                                <!-- JSTL에서 사용하는 반복문
                                    var속성 : items속성의 값을 보관하는 변수
                                    items속성 : 배열 또는 리스트 데이터를 정의하는 속성
                                    varStatus속성 : 인덱스 역할의 속성
                                -->
                                <c:forEach var="board" items="${list}" varStatus="c">
                                    <tr>
                                        <td>${c.count}</td>
                                        <%-- 제목을 클릭하면 상세 페이지로 이동하도록 a 태그로 감싸줍니다. --%>
                                        <td><a href="/board/${board.uid}">${board.b_title}</a></td>
                                        <td>${board.b_writer}</td>
                                        <td>${board.b_created_at}</td>
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>

                        <div class="d-flex justify-content-end">
                            <!-- 글쓰기 기능 요청 URL 작성하기 -->
                            <a href="/board/form" class="btn btn-primary my-2">글쓰기</a>
                        </div>
                    </div>
                    <div class="card-footer">
                        스프링부트 게시판 개발자 - 이동민
                    </div>
                </div>

                <script src="assets/js/search.js"></script>

        </body>

        </html>