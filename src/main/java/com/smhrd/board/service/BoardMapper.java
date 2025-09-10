package com.smhrd.board.service;

import com.smhrd.board.dto.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    // 글쓰기 기능
    public int write(Board board);

    // 게시글 조회
    public List<Board> list();

    // 특정 게시글 조회
    public Board view(int uid);

    // 게시글 수정
    public int update(Board board);

    // 검색 키워드 관련 게시글 조회
    public List<Board> search(String text);

    public int delete(int uid);

}
