package com.smhrd.board.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.smhrd.board.dto.Board;
import com.smhrd.board.service.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam; // ✅ @RequestParam을 사용하기 위해 추가

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;


@Controller
public class BoardController {

    @Autowired
    private BoardMapper mapper;

    @GetMapping("/")
    public String mainPage(Model model){

        // 2. 기능 수행 -> 모든 게시들을 조회하는 작업
        List<Board> list = mapper.list();

        // 조회한 게시글 데이터를 model 객체에 저장(request영역)
        // -> jsp파일에서 list 데이터를 접근
        model.addAttribute("list", list);

        return "boardMain"; // -> /WEB-INF/views/boardMin.jsp 이동
    }

    // ✅ 추가 : /board/list 매핑 (목록으로 돌아갈 때 404/변환오류 방지)
    @GetMapping("/board/list")
    public String list(Model model) {
        List<Board> list = mapper.list();
        model.addAttribute("list", list);
        return "boardMain";
    }

    @GetMapping("/board/form")
    public String formPage(){

        return "boardWrite";
    }

    @PostMapping("/board/write")
    public String write(Board board, MultipartFile file){

        // 1. 데이터 접근
        System.out.println(board);

        if(file.isEmpty()){
            System.out.println("파일이 없으므로 기존값으로 초기화");
        }else{

            try{
                String uuid = UUID.randomUUID().toString();
                String filename = uuid + file.getOriginalFilename(); // 랜덤값 + 원본파일명
                Path path = Paths.get(savePath+filename);
                file.transferTo(path);

                board.setB_img(filename);

            }catch (Exception e){
                e.printStackTrace();
            }
        }

        // 2. 기능수행 -> 사용자가 입력한 게시글 내용(제목, 작성자, 내용, 이미지 등)을 데이터베이스에 저장
        mapper.write(board);

        // 3. View 이동
        return "redirect:/";
    }

    // @PathVariable: URL경로에서 변수 값을 추출할 때 매개변수에 할당하는 기능
    // ex) localhost:8089/board/1 -> 숫자 1을 uid 변수에 저장
    @GetMapping("/board/{uid:\\d+}") // ✅ 정규식 추가 -> 숫자만 매칭되도록 변경
    public String detail(@PathVariable("uid") int uid, Model model){

        // 2. 기능 수행 -> uid값을 이용해서 해당 게시글 정보를 조회하는 작업
        //             -> model 객체에 Board 저장
        // 실습) 위 내용을 기반으로 기능 구현해보기 (메소드명: view, 입력값: uid, 반환타입: Board)
        //       - model 객체에 저장
        //       - boardDetail 페이지로 이동
        // uid를 이용해 게시글 정보를 조회합니다.
        Board board = mapper.view(uid);
        System.out.println(board);
        // 조회된 게시글 정보를 "board"라는 이름으로 Model 객체에 저장합니다.
        model.addAttribute("board", board);
        // boardDetail.jsp로 이동합니다.
        return "boardDetail";
    }

    @GetMapping("/board/updateForm")
    public String updateForm(int uid, Model model){
        System.out.println("✅ updateForm 실행됨, uid=" + uid); // 로그 확인
        Board board = mapper.view(uid);
        model.addAttribute("board", board);

        return "boardUpdate";
    }

    @Value("${save.path}")
    private String savePath;

    @PostMapping("/board/update")
    public String update(Board board, MultipartFile file){

        if(file.isEmpty()){
            System.out.println("파일이 없으므로 기존값으로 초기화");
        }else{

            try{
                //1. 파일 이름이 중복되지 않도록 랜덤값을 생성
                String uuid = UUID.randomUUID().toString();

                String filename = uuid + file.getOriginalFilename(); // 랜덤값 + 원본파일명

                System.out.println(filename);

                //2. 폴더 경로와 파일 이름을 하나로 병합
                Path path = Paths.get(savePath+filename);

                //3. 해당 경로에 저장
                file.transferTo(path);

                //4. Board객체에 이미지 파일명 저장
                // -> path로 저장하지 않는 이유는 외부에서 로컬PC의 C드라이브로 직접적인 접근 불가!
                // -> 요청이 들어왔을 때 ResourceConfig에서 실제 파일을 접근할 수 있도록 설정
                board.setB_img(filename);

            }catch (Exception e){
                e.printStackTrace();
            }

        }

        System.out.println("update>> "+board);

        //2.기능 수행
        mapper.update(board);


        return "redirect:/";
    }
    @GetMapping("/board/delete")
    public String delete(@RequestParam("uid") int uid) {
        mapper.delete(uid);
        return "redirect:/";
    }


}
