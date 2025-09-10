//1. 사용자가 입력한 검색어 가져오기
const input = document.searchForm.search;
const btn = document.searchForm.searchBtn;

//2. 검색버튼을 클릭했을 때 비동기 요청 보내기
const request = ()=> {

    const URL = "/board/search";
    let keyword = input.value; // 검색어 가져오기

    //3. 응답받은 게시글 데이터를 출력하기
    fetch( URL + "?text=" + keyword, { method:"GET" })
    .then(res => res.json() )
    .then( data => {

        console.log(data);

        // 조회된 게시글 데이터를 출력할 대상: <tbody>
        const tbody = document.querySelector("tbody");

        // 새로운 게시글 내용을 출력하기 위해서 기존 게시글 내용을 초기화
        tbody.innerHTML = "";

        //data -> [{uid:1, b_title:"", b_writer:"", ...},{...},...]
        for(let i=0; i<data.length; i++){
            let board = data[i];

            tbody.innerHTML += `
                 <tr>
                    <td>${i+1}</td>
                    <td><a href="/board/${board.uid}">${board.b_title}</a></td>
                    <td>${board.b_writer}</td>
                    <td>${board.b_created_at}</td>
                 </tr>
            `;

        }

    } )
    .catch( (err)=> {console.log(err);})

}

 btn.addEventListener("click", request);