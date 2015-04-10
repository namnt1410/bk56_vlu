class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @answers = Answer.all
    respond_with(@answers)
  end

  def show
    respond_with(@answer)
  end

  def new
    @answer = Answer.new
    respond_with(@answer)
  end

  def edit
  end

  def create
    @question = Question.find(params[:id])
    @answer = @question.answers.create(answer_params[:answer])
    @answer.user_id = current_user.id 
    
    if @answer.save
      redirect_to @question
    else
      flash.now[:danger] = "cannot create answer"
    end
    
    # @answer = Answer.new(answer_params)
    # respond_with(@answer)
  end

  def update
    @answer.update(answer_params)
    respond_with(@answer)
  end

  def destroy
    @answer.destroy
    respond_with(@answer)
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :content, :vote, :user_id)
    end
end
