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

                    <!-- 수정기능 요청 URL 작성하기 -->
                    <form action="/board/update" method="POST" enctype="multipart/form-data">
                        <!-- 기존 데이터 중 uid와 b_img 값을 input태그 hidden 타입으로 데이터 저장
                             ( model에 저장되어 있는 'board'로부터 value속성에 기존값으로 적용 ) -->
                        <input type="hidden" name="uid" value="${board.uid}">
                        <input type="hidden" name="b_img" value="${board.b_img}">

                        <table class="table table-bordered m-0">
                            <tbody>
                                <tr>
                                    <td class="table-active align-content-center text-center">글 제목</td>

                                    <!-- 기존 데이터 출력하기 ( model에 저장되어 있는 'board'로부터 value속성에 기존값으로 적용 ) -->
                                    <td>
                                        <input class="form-control" type="text" name="b_title" value="${board.b_title}">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-active align-content-center text-center">글 작성자</td>

                                    <!-- 기존 데이터 출력하기 ( model에 저장되어 있는 'board'로부터 value속성에 기존값으로 적용 ) -->
                                    <td>
                                        <input class="form-control-plaintext" readonly type="text" name="b_writer"
                                            value="${board.b_writer}">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-active align-content-center text-center">내용</td>

                                    <!-- 기존 데이터 출력하기 ( model에 저장되어 있는 'board'로부터 value속성에 기존값으로 적용 ) -->
                                    <td>
                                        <textarea class="form-control" rows="3" name="b_content">${board.b_content}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-active align-content-center text-center">파일첨부</td>
                                    <td><input class="form-control" type="file" name="file"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <a href="/" class="btn btn-primary">목록</a>
                                        <input type="submit" class="btn btn-primary" value="작성완료">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="card-footer">
                    스프링부트 게시판 개발자 - 이동민
                </div>
            </div>
        </div>
        </div>

    </body>

    </html>