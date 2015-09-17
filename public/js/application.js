$(document).ready(function () {
  $(".vote-question-button").on("click", function(event){
    event.preventDefault();
    var route = $(this).attr("href");
    $.ajax({
      url: route,
      type: "POST",
      dataType: "json"
    })
    .done(function(data){
      $("#total-question-votes").html(data.points)
    });
  });

  $(".vote-answer-button").on("click", function(event){
    event.preventDefault();
    var route = $(this).attr("href");
    $.ajax({
      url: route,
      type: "POST",
      dataType: "json"
    })
    .done(function(data){
      debugger
      console.log("HI")
      var answer_obj = $("#answer" + data.id)
      $(answer_obj).find("#total-answer-votes").html(data.points)
    });
  });
});
