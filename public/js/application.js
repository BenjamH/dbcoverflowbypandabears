// vote DOWN QUESTION
$(document).ready(function () {
// -------------------------------------------


  $(".vote-question-button-down").on("click", function(event){
    event.preventDefault();
    var route = $(this).attr("href");
    console.log(route)
    $.ajax({
      url: route,
      type: "POST",
      dataType: "json"
    })
    .done(function(response){
      $("#total-question-votes").html(response.points)
    });
  });

// vote UP QUESTION
  $(".vote-question-button-up").on("click", function(event){
    event.preventDefault();
    var route = $(this).attr("href");
    console.log(route);
    $.ajax({
      url: route,
      type: "POST",
      dataType: "json"
    })
    .done(function(response){
      $("#total-question-votes").html(response.points)
    });
  });




// vote UP ANSWER
  $(".vote-answer-button-up").on("click", function(event){
    event.preventDefault();
    var route = $(this).attr("href");
    $.ajax({
      url: route,
      type: "POST",
      dataType: "json"
    })
    .done(function(response){
      debugger
      console.log("HI")
      var answer_obj = $("#answer" + response.id)
      $(answer_obj).find("#total-answer-votes").html(response.points)
    });
  });


  // vote DOWN ANSWER




//----------------------------------------------
});

