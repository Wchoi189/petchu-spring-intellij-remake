<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <link href="/resources/css/shopproduct_review.css" rel="stylesheet"/>
    <link rel="shortcut icon" href="#">
    <script src="https://kit.fontawesome.com/21038295a9.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <script src="/resources/pagination.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="/resources/chart.js"></script>
</head>
<div id="page_review">
    <form name="myfrm" id="myfrm" method="post" action="insert" enctype="multipart/form-data"
          onsubmit="return onSubmit(event)">

        <div class="all">
            <div class="insert_page">
                <div class="page_title">
                    <h2>리뷰 작성</h2>
                </div>

                <div class="page_info">
                    <div class="user_info">
                        <span><img src="/resources/icon/user_info.png" width="80"/> </span>
                        <span id="user_name">${vo.uid}</span>
                        <input type="hidden" value="${vo.pno}" name="pno"/>
                        <input type="hidden" value="${vo.bno}" name="bno"/>
                        <span></span>
                    </div>
                    <div class="review_details1">
                        <span class="details1_title">만족도</span>
                        <span><img src="/resources/icon/thumb-down.png" width="30" class="details1_thumbs"/></span>
                        <span><img src="/resources/icon/thumbs-up.png" width="30" class="details1_thumbs"/></span>
                    </div>
                    <div class="review_details2">

                    </div>
                    <!--helpcount까지-->
                    <div class="inin_page">
                        <!--한줄요약까지-->
                        <div class="page_heading">
                            <span class="page_title_span_wrap"><img src="/resources/icon/product_review1.png"
                                                                    width="25px"/></span><span
                                class="page_title_span_wrap ptitle">상품 품질 리뷰</span>
                            <h5>상품에 대해서 얼마나 만족하시나요?</h5>
                        </div>
                        <!--r_q-->
                        <div class="p_info">

                            <div class="bno" style="display:none;">
                                <select id="uid" name="uid">
                                    <option value="${vo.uid}" selected>${vo.uid}</option>
                                </select>
                                <div id="bno">${vo.bno}</div>
                                <div id="pno">${vo.pno}</div>
                            </div>

                            <div class="product_container">
                                <div id="p_img">
                                    <img src="${vo.pimage}" width=200 height=200/>
                                </div>

                                <div class="product_name">
                                    <div id="pname">
                                        <div>${vo.pname}</div>
                                    </div>
                                    <div class="star">
                                        <div class="make_star">
                                            <input type="hidden" style="display:none;" id="star_rating" name="star">
                                            <div class="rate" style="display:inline; cursor : pointer;">
                                                <i class="fa-solid fa-star" value="1"></i>
                                                <i class="fa-solid fa-star" value="2"></i>
                                                <i class="fa-solid fa-star" value="3"></i>
                                                <i class="fa-solid fa-star" value="4"></i>
                                                <i class="fa-solid fa-star" value="5"></i> &nbsp;
                                                <div style="display :inline" id="evaluation" class="evaluation"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--p_ns-->
                        </div>
                        <div class="review_details">
                            <div class="d_review">
                                <h2>상세리뷰</h2>
                            </div>
                            <div class="textarea_review">
                                <textarea name="review" id="textarea_1" rows="10" cols="95"
                                          placeholder="리뷰는 10자 이상 작성부탁드립니다"></textarea>

                            </div>
                            <div class="textarea_review_row_bottom1">
                                <div class="review_overlay_row">
                                    <div class="review_overlay">이 상품을 지인에게 추천하실래요?</div>
                                    <div class="word_count1" data-count="0"></div>
                                </div>
                            </div>

                        </div>
                        <div class="review-photo-area">

                            <div class="photo_wrapper">
                                <div class="photo_a">
                                    <h3>사진첨부</h3>
                                </div>

                            </div>
                            <div class="r_photo_file_wrapper">
                                <div class="file">
                                    <button class="review_file_upload-btn" type="button">
                                        사진 올리기
                                    </button>
                                    <input id="btn_file" name="file_input" class="file_input"
                                           type="file" multiple/>

                                    <span class="review_modify_file_count">
                                        <strong class="reviewFileUploadCount">0</strong>&nbsp;/&nbsp;<span
                                            class="reviewFileUploadMaxCount">10</span>
                            </span>
                                    <span class="review_file_guide">사진은 최대 20MB 이하의 JPG, PNG, GIF 파일 10장까지 첨부 가능합니다.</span>
                                </div>


                                <div class="my-review-filelist-wrap" style="display: block;">
                                    <ul class="review_file_list_ul">

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="rtitle">
                        <div>
                            <h3 class="rtitleh3">한줄요약</h3>
                        </div>
                        <div id="rtitle summary_container">
                            <div class="textarea_review">
                                    <textarea name="rtitle" id="textarea_2" class="textarea_2" rows="3" cols="95"
                                              placeholder="한 줄 요약을 입력해주세요" maxlength=30></textarea>
                            </div>
                            <div class="textarea_review_row_bottom2">
                                <div class="review_overlay_row2">

                                    <div class="word_count2_container">
                      <span class="word_count2" data-count="0">
                      </span><span>/</span><span>30</span>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <!--rtitle-->
                </div>
                <!--inin_page-->
                <div class="h_info" style="display:none;">
                    <div class="satis">
                        <p>만족도</p>
                    </div>
                    <div>
                    </div>
                </div>
                <div id="review_btn">
                    <button class="review_btn" type="reset">취소하기</button>
                    <div class="box"></div>
                    <%--<a href="javascript:;"  onclick="document.getElementById('myfrm').submit();" id= f"review_submit" class="review_submit review_btn" style="background: #32af00; color: black">등록하기</a>--%>
                    <button id="submit_review" type="submit" class="review_btn"
                            style="background: #32af00; color: black">등록하기
                    </button>
                </div>
            </div>
            <!--page_info-->

        </div>
        <!--insert_page-->

        <!--    all      -->
    </form>
</div>
<script>
    //별점
    $('.make_star .fa-solid').click(function () {
        let $starRating = $('#star_rating');  //input box to store star rating
        let $evaluation = $('#evaluation');
        let targetNum = $(this).index() + 1;  //star rating value based on index
        //$('#makeStar').val(targetNum);
        let check = $(myfrm.star).val(targetNum);
        switch (targetNum) {
            case 1:
                $evaluation.html("별로에요");
                $starRating.val(1)
                break;
            case 2:
                $evaluation.html("조금 별로에요");
                $starRating.val(2)
                break;
            case 3:
                $evaluation.html("보통이에요");
                $starRating.val(3)
                break;
            case 4:
                $evaluation.html("좋아요");
                $starRating.val(4)
                break;
            case 5:
                $evaluation.html("아주 좋아요");
                $starRating.val(5)
                break;
        }

        $('.make_star .fa-solid').css({color: '#D3D3D3'})
        $('.make_star .fa-solid:nth-child(-n+' + targetNum + ')').css({color: '#F08d28'});

    });

    //사진첨부 버튼클릭
    $(".review_file_upload-btn").on("click", function () {
        $("#btn_file").click();
    });

    let fileCount = 0;
    let fileNum = 0;
    let arr = new Array();

    $(document).ready(function (e) {
        $("input[type='file']").change(function (e) {
            /*   //div 내용 비워주기
               $('.preview').empty();
   */
            let files = e.target.files;
            arr = Array.prototype.slice.call(files);

            //업로드 가능 파일인지 체크
            for (let i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
            }
            $(".preview").show();
            preview(arr);

        });//filechange


        function checkExtension(fileName, fileSize) {
            let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            let maxSize = 20971520;  //20MB
            let fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();

            if (fileEx !== "png" && fileEx !== "jpg" && fileEx !== "gif") {
                alert("등록가능한 형식이 아닙니다.");
                return false;
            }

            if (fileSize >= maxSize) {
                alert('파일 사이즈 초과');
                $("input[type='file']").val("");  //파일 초기화
                return false;
            }

            if (regex.test(fileName)) {
                alert('업로드 불가능한 파일이 있습니다.');
                $("input[type='file']").val("");  //파일 초기화
                return false;
            }
            return true;
        }

        function preview(arr) {
            arr.forEach(function (f) {

                //파일명이 길면 파일명 ...으로 처리
                let fileName = f.name;
                if (fileName.length > 10) {
                    fileName = fileName.substring(0, 7) + "..";
                }

                //div에 이미지 추가
                let str = `<li class="file_list_li"><div class="file_list_li_div">`

                //이미지 파일 미리보기
                if (f.type.match('image.*')) {  //파일을 읽기 위한 FileReader객체 생성
                    let reader = new FileReader(); //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                    reader.onload = function (e) {
                        console.log(" reader.onload = function (e) === ?")
                        console.log(e)
                        str += '<span class="preview"><img class="my-review_image" src="' + e.target.result + '" width=66.7 height=66.7 /></span>'
                        /*    str += '<p>' + fileName + '</p>';*/
                        str += `<span class="attachment_caption_container">
                                <textarea rows="3" cols="75" class="caption__text" placeholder="이 사진의 설명글을 작성해보세요." maxlength="150"></textarea>
                                </span>`

                        str += `<span class="attachment_caption_right">
                                <span class="word__count"><span class="word__count_data">0</span>/150</span><br>
                                <div><a class="reviewFileLisatDeleteBtn reviewFileListDeleteBtnjs" href="javascript:void(0);">삭제</a></div>
                                </span>`

                        str += `</div></li>`;
                        $(str).appendTo('.review_file_list_ul');
                    }
                    reader.readAsDataURL(f);
                } else {
                    str += '<img src ="/resources/img/fileImg.png" title"' + f.name + '" width=68 height=68 />'
                    str += `</div></li>`
                    $(str).appendTo(".review_file_list_ul");
                }
            });
        }
    });

    //submit 버튼을 클릭한 경우
    function onSubmit(event) {
        event.preventDefault()

        let review_details = document.getElementById('textarea_1').value;
        let review_summary = document.getElementById('textarea_2').value;
        let files = document.getElementById('btn_file').files;
        let uid = document.getElementById('user_name').innerText;
        let pno = document.getElementById('pno').innerText;
        let bno = document.getElementById('bno').innerText;
        let star = document.getElementById('star_rating').value;
        if (review_details === "") {
            alert("리뷰를 입력해주세요");
            review_details.focus();
            return false;
        } else if (review_summary === "") {
            alert("한줄요약을 입력해주세요");
            review_summary.focus();
            return false;
        }

        if (!confirm("리뷰를 등록하실래요?" + "\n" + "review_details : " + review_details + "\n" + " review_summary : " + review_summary + "\n" + " files : " + files + "\n" + "uid :" + uid + "\n" + " star " + star)) return false;

        document.myfrm.submit();

        return true;

    }

    // textarea 저녀 변수
    let word_count1 = $(".word_count1");
    let word_count2 = $(".word_count2");
    // 초기 글자 수
    word_count1.html(0);
    word_count2.html(0);

    //word counter1, top
    $("#textarea_1").on('keyup', function (event) {
        var textarea_1 = $("#textarea_1").val();
        $(".word_count1").html(textarea_1.length);
    })

    //word counter2, bottom
    $('#textarea_2').on('keyup', function (event) {
        var textarea_2 = $("#textarea_2").val()
        $(".word_count2").html(textarea_2.length);
    })


</script>