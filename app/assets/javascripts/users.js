$(function(){
  $('.wrapper').on('click', '.btn-yes', function(e){ 
    e.preventDefault();
    $(this).empty();
    $(this).text("YES");

    // console.log($(this).parents('.caption').attr("data-user-advice-id"));
    $(this).parents('.vote-btns').find('.btn-no').css({'background':'grey'}).fadeTo('slow', .30);

    var method = $(this).parent().attr('data-method');
    var action = $(this).parent().attr('href');
    
    var user_advice_id = $(this).parents('.user-advice').attr("data-user-advice-id")
    var advice_id = $(this).parents('.user-advice').attr("data-user-advice-id")

    $.ajax(action, {
      type: method,
      // context: this,
      dataType: 'script'
    });

  // $('.btn-didnt-work').click(function(e){
  //   $(this).empty();
  //   $(this).text("NOPE!");
    
  //   $.ajax({
  //     type: "POST",
  //     url:"/upvotes", 
  //     success:function(result){
  //   }});
  // });

  });

});