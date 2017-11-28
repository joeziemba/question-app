class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
    if @answers.any?{|a| a[:accepted] == true}
      @selected_answer = @answers.find{|a| a[:accepted] == true}
      @answers = @question.answers.where(accepted: false)
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.update(params[:id], question_params)
    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    @question.destroy
    @answers.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
