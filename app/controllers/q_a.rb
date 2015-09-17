#create a new question
get '/questions/new' do
	erb :'new_question'
end

#save new question to db
post '/questions' do
  params[:user_id] = session[:user_id]
  question = Question.new(params)

  question.save
  redirect "/"
end

#save new answer to db
post '/questions/:qid/answers' do
  answer = Answer.new({
    "description" => params[:description],
    "user_id" => session[:user_id],
    "question_id" => params[:qid]
  })

  if answer.save
    if request.xhr?
      erb :_answer, layout: false, locals: {answer: answer}
    else
      redirect "/questions/#{params[:qid]}"
    end
  else
    erb :'question_page'
  end

end


get '/questions/:question_id' do
  @question =  Question.find(params[:question_id])
  erb :question_page
end

post '/questions/:question_id/down_vote' do
  p params
  p "hit route"
  if request.xhr?
    question = Question.find(params[:question_id])
    question.votes.last.delete
    points = question.votes.count
    return {points: points}.to_json
  else
    redirect "/questions/#{question.id}"
  end
end

post '/questions/:question_id/up_vote' do
  if request.xhr?
    question = Question.find(params[:question_id])
    question.votes.create({question_value: 1, votable_type: "question"})
    points = question.votes.count
    return {points: points}.to_json
  else
    redirect "/questions/#{question.id}"
  end
end

post '/answers/:answer_id/up_vote' do
  if request.xhr?
    answer = Answer.find(params[:answer_id])
    answer.votes.create({answer_value: 1, votable_type: "answer"})
    points = answer.votes.count
    return {points: points, id: answer.id}.to_json
  else
    redirect "/questions/#{question.id}"
  end
end

post '/answers/:answer_id/down_vote' do
  if request.xhr?
    answer = Answer.find(params[:answer_id])
    answer.votes.last.delete
    points = answer.votes.count
    return {points: points, id: answer.id}.to_json
  else
    redirect "/questions/#{question.id}"
  end
end

