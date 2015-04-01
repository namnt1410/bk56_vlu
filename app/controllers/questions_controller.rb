class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :edit]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:destroy, :edit]
  
  respond_to :html

  def index
    @questions = Question.all
    @questions = Question.paginate(page: params[:page], per_page: 5)
    respond_with(@questions)
  end

  def show
    @question = Question.find(params[:id])
    @question.views += 1
    @question.save
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params.merge!({user: current_user}))
    @question.save
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.delete
    respond_with(@question)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content )
    end
    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to questions_url, alert: "You can't delete or edit other's posts!" if @question.nil?
    end
end
