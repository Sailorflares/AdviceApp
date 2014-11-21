$(function(){
  $('.btn-worked').click(function(){
      $(this).empty();
      $(this).text("YES");
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