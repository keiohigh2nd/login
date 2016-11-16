class QuestionsController < ApplicationController
  require 'time'
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    #@user = User.find(params[:user_id])
    #@questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @user = User.find(params[:user_id])
    @question = @user.questions[0]
  end

  # POST /questions
  # POST /questions.json
  def create
    @user = User.find(params[:user_id])
    if @user.questions.length > 0
      for q in @user.questions do 
        q.destroy
      end
    end
    @question = @user.questions.create(question_params)
    diff = (Time.now - @user.created_at).divmod(24*60*60)
    hours =  diff[1].divmod(60*60)
    if hours[0] < 1 
       redirect_to controller: 'users', action: 'recommendation', id: @user.id 
    else
       redirect_to @user
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      #@question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:user_id, :question_date, :life, :past, :family, :alle, :pharm)
    end
end
