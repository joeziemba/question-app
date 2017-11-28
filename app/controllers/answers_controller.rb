class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params["question_id"])
    @answer.question = @question
    if @answer.save
      redirect_to @question
    else
      @answers = @question.answers
      @user = @question.user
      render :template => "questions/show"
    end
  end

  def update
    @answer = Answer.update(params[:id], {accepted: true})
    if @answer.save
      flash[notice] = "Answer accepted"
      redirect_to @answer.question
    else
      flash[notice] = "Answer not accepted"
      redirect_to @answer.question
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
