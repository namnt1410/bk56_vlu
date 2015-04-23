class AnswersController < ApplicationController
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
end
