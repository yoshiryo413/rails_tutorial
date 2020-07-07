class AnswersController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy
  ]
  
  
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success'
    else
      redirect_to question_path(@question), alert: 'invaild'
    end 
  end 
  
  
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answer.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success'
    else
      flash[:alert] = 'invaild'
      render :edit
    end
  end
  
  def destroy
    
    @answer = @question.answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: 'Deleted'
  end
  
  private
  
  def set_question
    @question = Question.find(params[:question_id])
  end 

  
   def answer_params
     params.require(:answer).permit(:content, :name, :question_id)
   end 
   
  
  
end
