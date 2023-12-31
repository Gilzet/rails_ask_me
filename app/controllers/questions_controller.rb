class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  def new
    @question = Question.new
  end

  def create
    question = Question.create(question_params)

    redirect_to questions_path, notice: 'Вопрос создан!'
  end

  def edit
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удален!'
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Вопрос изменен!'
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  private

  def question_params
    params.require(:question)
          .permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end

