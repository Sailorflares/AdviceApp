$(document).ready(function(){
  $("button").click(function(e){
    $this = $(this);
    $.ajax({
      type: "POST",
      url:"/upvote", 
      success:function(result){
      $this.val("YES!");
    }});
  });
});