<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<link rel="shortcut icon" href="#">
<script src="/resources/pagination.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="/resources/css/r_read.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/21038295a9.js" crossorigin="anonymous"></script>
</head>

<div id="page">
	<form name="frm" class="frm">
	<div id="reviewpage"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each join}}
	<div class="readpage">
		<div class="rid" style="display:none;">{{rid}}</div>
      <div class="line">
     <div class="p_info">
        <div class="p-img">
          <img src={{pimage}} width=80 height=80 />
        </div>
        <div class="pname">
          <div id="name">{{pname}}</div>
        </div>
      </div><!--p_info-->
       <div class="button">
         <div class="buttons">
           <input type="submit" class="btnsubmit" rid="{{rid}}" value="수정" />
           <input type="reset"  class="btndelete" rid="{{rid}}" value="삭제">
         </div>
       </div>
     </div><!--line-->
       <hr/>
       <div class="r_info">
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
          <div class="rdate">
           {{rdate}}
         </div>
      </div><!--r_info-->
       <div class="rtitle">
         {{rtitle}}
       </div>
       <div class="rimage">
         <div class="rimage1" style="display:none;" rimage1={{rimage1}}>                   
			<img src="/display?fileName={{rimage1}}" width=200 height=200/>      
         </div>
         <div style="margin:5px;"></div>
         <div class="rimage2" style="display:none;" rimage2={{rimage2}}>                     
			<img src="/display?fileName={{rimage2}}" width=200 height=200/>             
         </div>
        </div>
       <div class="review">
         {{review}}
       </div>
       <div class="help" style="display:none;">
         {{helpcount}}
       </div>
     </div><!--readpage-->
	 {{/each}}
	<hr/>
	 </script>
	 	<div class="pagination"></div>
	 </form>
	</div>
<script>
	
	//리뷰수정
	$(frm).on("click",".btnsubmit",function(e){
		e.preventDefault();
		var rid=$(this).attr("rid");
		
		location.href='update?rid='+ rid;
	});
	//리뷰삭제
	$(frm).on("click",".btndelete", function(e){
		e.preventDefault();
		//var rid=$(this).parent().attr("rid");
		var rid=$(this).attr("rid");
		if(!confirm("리뷰를 삭제하시겠어요?")) return;
		$.ajax({
			type:"post",
			url:"/review/delete",
			data:{rid:rid},
			success:function(){
				alert("삭제성공");
				location.reload();
			}
		});
		
	});
var page=${param.page ==null ? 1:param.page};
	getReview();
	
	function getReview(){
		$.ajax({
			type:"get",
			url:"/review/list.json",
			data:{page:page},
			dataType:"json",
			success:function(data){
				 var temp=Handlebars.compile($("#temp").html());
				 $("#reviewpage").html(temp(data));
				 $(".pagination").html(getPagination(data));
				 
				 var rate = $('#reviewpage .rate');
					rate.each(function(){
                        let tagetscore = $(this).attr("data-rate");
                        $(this).find('.fa-solid').css({color:'#D3D3D3'});
						$(this).find('.fa-solid:nth-child(-n+' + tagetscore + ')').css({color:'#F08d28'});
					});
				$(".rimage1").each(function(){
					var rimage1=$(this).attr("rimage1");
					var target=$(this);
					var rimage2=$(this).parent().find(".rimage2").attr("rimage2");
					var target2=$(this).parent().find(".rimage2");
					if(rimage1 != ""){
						if(target.css("display")=="none"){
							target.show();
						}
					}else if(rimage2 != ""){
						if(target2.css("display")=="none"){
							target2.show();
						}
					}else{
						target.hide();
						target2.hide();
					}

				});
			}
		});
	}
	$(".pagination").on("click","a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getReview();
	})
</script>


