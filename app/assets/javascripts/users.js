$(function(){
  $('.btn-worked').click(function(){
    $(this).empty();
    $(this).text("YES");

    console.log($(this).parents('.caption').attr("data-user-advice-id"));

    var method = $(this).parent().attr('data-method');
    var action = $(this).parent().attr('href');
    
    $.ajax(action, {
      type: method,
      dataType: 'HTML'
    }).done(function(response){
      // $('.caption').append(@user.update_vote)
    });
  });

  $('.btn-didnt-work').click(function(e){
    $(this).empty();
    $(this).text("NOPE!");
    
    $.ajax({
      type: "POST",
      url:"/upvotes", 
      success:function(result){
    }});
  });
});