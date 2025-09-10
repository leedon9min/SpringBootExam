package com.smhrd.board.controller;

import com.smhrd.board.dto.Board;
import com.smhrd.board.service.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

// 스프링 컨테이너에 "비동기 요청을 처리하는 컨트롤러"라고 알려주는 위함
// @Controller VS @RestController
//  viewname 반환   데이터 반화
@RestController
public class BoardRestController {

    @Autowired
    private BoardMapper mapper;

    //요청URL: ~~/board/search?text=러닝
    @GetMapping("/board/search")
    public List<Board> search(String text) {

        //1. 데이터 접근

        //2. 기능 수행 -> 검색키워드와 관련된 게시글을 조회하는 작업
        //            -> 조회된 결과값은 하나 이상
        //            -> List 객체에 board 객체가 저장되도록 구현(반환타입)
        List<Board> list =mapper.search("%"+text+"%");

        //3. 데이터 반환
        return list;
    }
}
