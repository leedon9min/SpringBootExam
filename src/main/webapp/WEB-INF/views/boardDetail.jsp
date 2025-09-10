<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>스프링 부트 - 게시판 실습</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body>
        <div class="container mt-5">
            <h2>스프링부트 - 게시판 실습</h2>
            <div class="card">
                <div class="card-header">
                    게시판
                </div>
                <div class="p-4">
                    <table class="table table-bordered m-0">
                        <tbody>
                            <tr>
                                  <td class="table-active align-content-center text-center">글 제목</td>
                                  <td>${board.b_title}</td>
                            </tr>
                            <tr>
                                  <td class="table-active align-content-center text-center">글 작성자</td>
                                  <td>${board.b_writer}</td>
                            </tr>
                            <tr>
                                  <td class="table-active align-content-center text-center">내용</td>
                                  <td>${board.b_content}</td>
                            </tr>
                            <tr>
                                <td class="align-content-center text-center" colspan="2">
                                    <!-- model객체에 저장된 이미지 가져오기
                                         - 이미지가 없는 경우 "업로드된 이미지가 없습니다" 메세지 출력하기 
                                    -->
                                    <img src="http://localhost:8089/save/${board.b_img}">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <a href="/board/list" class="btn btn-primary">목록</a>
                                    <a href="/board/updateForm?uid=${board.uid}" class="btn btn-primary">수정</a>

                                    <a href="/board/delete?uid=${board.uid}"
                                       class="btn btn-danger"
                                       onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    스프링부트 게시판 개발자 - 이동민
                </div>
            </div>
    </body>

    </html>