<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<head>
    <link rel="shortcut icon" href="#">
    <script src="/resources/pagination.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <link href="/resources/css/r_read.css" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/21038295a9.js" crossorigin="anonymous"></script>
    <script type="text/JavaScript" src=" https://MomentJS.com/downloads/moment.js"></script>
</head>

<div id="page">
    <form name="frm" class="frm">
        <div id="review-list"></div>
        <%--template engine--%>
        <script id="temp" type="text/x-handlebars-template">
            {{#each join}}
            <div class="myreview-list-page">

                <div class="review-row-1">
                    <div class="rid" style="display:none;">{{rid}}</div>
                    <div class="review-header-row">
                        <div class="product-img" onclick="location.href='/shopproduct/read?pno='+{{pno}}">
                            <img src={{pimage}} width=60 height=60/>
                        </div>
                        <div class="product-name-wrapper">
                            <div class="product-name" onclick="location.href='/shopproduct/read?pno='+{{pno}}">
                                {{pname}}
                            </div>
                        </div>

                        <div class="review-header-row-col-3">
                            <div class="review-btn-wrapper">
                                <button type="submit" class="btnsubmit review-btns" rid="{{rid}}" value="수정">수정</button>
                                <span> | </span>
                                <button type="reset" class="btndelete review-btns" rid="{{rid}}" value="삭제">삭제</button>

                            </div>
                        </div>

                    </div>
                </div><!--end of header-line-1-->

                <div class="review-row-2-header">

                    <div class="rating-info"><%--star and date--%>
                        <div class="star">
                            <div class="rate" style="display:inline; cursor : pointer;" data-rate="{{star}}">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i> &nbsp;
                                <div style="display :inline" id="evaluation"></div>
                            </div><!--rate-->
                        </div>
                        <div class="review-date">
                            {{formatTime rdate "YYYY.MM.DD"}}
                        </div>
                    </div>
                </div>
                <div class="review-image-row">
                    <div class="review-image">
                        <div class="rimage1" rimage1={{rimage1}}>
                            <img src="/display?fileName={{rimage1}}"/>
                        </div>
                        <div class="rimage2" rimage2={{rimage2}}>
                            <img src="/display?fileName={{rimage2}}"/>
                        </div>
                        <div class="rimage3" rimage3={{rimage3}}>
                            <img src="/display?fileName={{rimage3}}"/>
                        </div>
                    </div>
                </div>
                <dic class="review-row-2-body">
                    <div class="review-title">
                        {{rtitle}}
                    </div>
                    <div class="review-summary">
                        {{review}}
                    </div>
                    <%--                    <div class="review-survey">
                                            <div class="review-survey-data">
                                                <p>사용시간 아주 만족스러워요
                                                    디자인 마음에 들어요
                                                    착용감 좋지 않아요
                                                    음질 적당히 만족해요</p>
                                            </div>

                                        </div>--%>
                </dic>

                <!--line-2 review-title-->


                <div class="help" style="display:none;">
                    {{helpcount}}
                </div>

                <!--readpage-->
                {{/each}}
                <hr/>
            </div><!--line-->


        </script>
        <div class="pagination"></div>
    </form>
</div>
<script>
    let DateFormats = {
        short: "YYYY.MM.DD",
        long: "dddd DD.MM.YYYY"
    };
    // Use UI.registerHelper..
    Handlebars.registerHelper('formatTime', function (date, format) {
        var mmnt = moment(date);
        return mmnt.format(format);
    });
</script>
<script>

    //리뷰수정
    $(frm).on("click", ".btnsubmit", function (e) {
        e.preventDefault();
        var rid = $(this).attr("rid");

        location.href = 'update?rid=' + rid;
    });
    //리뷰삭제
    $(frm).on("click", ".btndelete", function (e) {
        e.preventDefault();
        //var rid=$(this).parent().attr("rid");
        var rid = $(this).attr("rid");
        if (!confirm("리뷰를 삭제하시겠어요?")) return;
        $.ajax({
            type: "post",
            url: "/review/delete",
            data: {rid: rid},
            success: function () {
                alert("삭제성공");
                location.reload();
            }
        });

    });
    var page =${param.page ==null ? 1:param.page};
    getReview();

    function getReview() {
        $.ajax({
            type: "get",
            url: "/review/list.json",
            data: {page: page},
            dataType: "json",
            success: function (data) {
                var temp = Handlebars.compile($("#temp").html());
                $("#review-list").html(temp(data));
                $(".pagination").html(getPagination(data));

                var rate = $('#review-list .rate');
                rate.each(function () {
                    let tagetscore = $(this).attr("data-rate");
                    $(this).find('.fa-solid').css({color: '#D3D3D3'});
                    $(this).find('.fa-solid:nth-child(-n+' + tagetscore + ')').css({color: '#F08d28'});
                });
                $(".rimage1").each(function () {
                    var rimage1 = $(this).attr("rimage1");
                    var target = $(this);
                    var rimage2 = $(this).parent().find(".rimage2").attr("rimage2");
                    var target2 = $(this).parent().find(".rimage2");
                    if (rimage1 != "") {
                        if (target.css("display") == "none") {
                            target.show();
                        }
                    } else if (rimage2 != "") {
                        if (target2.css("display") == "none") {
                            target2.show();
                        }
                    } else {
                        target.hide();
                        target2.hide();
                    }

                });
            }
        });
    }

    $(".pagination").on("click", "a", function (e) {
        e.preventDefault();
        page = $(this).attr("href");
        getReview();
    })
</script>


