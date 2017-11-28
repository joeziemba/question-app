class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params["question_id"])
    @answer.question = @question
    if @answer.save
      redirect_to @question
    else
      render :template => "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
