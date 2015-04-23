class AnswersController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!, only: [:destroy, :edit]
   
  def new
    @answer = Answer.new
  end
  
  def create
    @question = Question.find(params[:question_id])
    # @answer = @question.answers.build(params[:answer_params])
    # @answer = current_user.comments.build(params[:answer_params])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answer.user_id = current_user.id
    @answer.save
    
    redirect_to @question
  end

  def destroy
    @answer.delete
    respond_with(@answer)
  end
  
  def answer_params
    params.require(:answer).permit(:description,:vote, :user_id)
  end
  
  # private
  #   def correct_user
  #     @answer = current_user.answers.find_by(id: params[:id])
  #     redirect_to questions_url, alert: "You can't delete or edit other's posts!" if @question.nil?
  #   end
=======
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
    @answer = Answer.new(answer_params)
    @answer.save
    respond_with(@answer)
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
      params.require(:answer).permit(:question_id, :title, :description)
    end
>>>>>>> upstream/develop
end
