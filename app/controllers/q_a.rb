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

# #create a new answer
# get '/answers/new' do
#   erb :'new_answer'
# end


# #save new answer to db
# post '/answers' do
# 	answer = Answer.new(params)
# 	answer.save
# 	redirect "SEND ME TO SOME PAGE"
# end

#save new answer to db
post '/questions/:qid/answers' do
  answer = Answer.create({
    "description" => params[:description],
    "user_id" => session[:user_id],
    "question_id" => params[:qid]
  })
	redirect "/questions/#{params[:qid]}"
end


get '/questions/:question_id' do
  p params[:question_id]
  @question =  Question.find(params[:question_id])
  erb :'question_page'
end

post '/questions/:question_id/vote' do
  if request.xhr?
    question = Question.find(params[:question_id])
    question.votes.create({question_value: 1, votable_type: "question"})
    points = question.votes.count
    return {points: points}.to_json
  else
    redirect "/questions/#{question.id}"
  end
end

post '/answers/:answer_id/vote' do
  if request.xhr?
    answer = Answer.find(params[:answer_id])
    answer.votes.create({answer_value: 1, votable_type: "answer"})
    points = answer.votes.count
    return {points: points, id: answer.id}.to_json
  else
    redirect "/questions/#{question.id}"
  end
end



