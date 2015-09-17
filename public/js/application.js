
$(document).ready(function () {
// -------------------------------------------

// vote up/down QUESTION

implementQuestionVoting();

// vote up/down ANSWER
implementAnswerVoting();

// =========
submitAnswer();

//----------------------------------------------
});

var implementQuestionVoting = function() {
  $(".question-vote").on("click", function(event){
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
  })
}

var implementAnswerVoting = function() {
    $(".answer-vote").on("click", function(event){
      event.preventDefault();
      var route = $(this).attr("href");
      $.ajax({
        url: route,
        type: "POST",
        dataType: "json"
      })
      .done(function(response){
        // var answer_obj = $("#answer" + response.id)
        // $(answer_obj).find
        $("#total-answer-votes").html(response.points)
      });
    })
};

var submitAnswer = function(){
  $('form').on('submit', function(event){
    event.preventDefault();
    console.log('sucess');
    var url = $(this).attr('action'),
        method = $(this).attr('method'),
        data = $(this).serialize(),
        beforeSend = $(this).append('<i class="fa fa-spinner fa-pulse"></i>'),
        config = { url: url,
              data: data,
              method: method,
              dataType: 'html'
              }

    $.ajax(config)

    .done(function(response){
      $('ul#answers').append(response);
      $('form input[type=text]').val("");
      $('.fa-spinner').remove();
    })

    .fail(function(response){
      console.log('fail');
    })

  });
};



