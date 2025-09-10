package com.smhrd.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// DTO 클래스 생성 시 필요한 어노테이션 정의하기
// - Getter&Setter 생성, 기본생성자, 초기화생성자
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
    private int uid;
    private String b_title;
    private String b_writer;
    private String b_content;
    private String b_img;
    private String b_created_at;
}
