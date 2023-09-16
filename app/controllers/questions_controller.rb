class QuestionsController < ApplicationController
    before_action :find_question, only: [:show, :edit, :update, :destroy]

    def new 
        @question = Question.new
    end

    def create
        @question = Question.new question_params

        if @question.save
            redirect_to home_path
        else
            render :new
        end
    end

    def show 
        @question.view_count += 1
        @question.save

        @answers = @question.answers.order(created_at: :desc)
        @answer = Answer.new
    end

    def index
        @questions = Question.order(created_at: :desc)
        # render json: @questions
    end

    def edit
    end

    def update 

        if @question.update(question_params)
            redirect_to question_path(@question.id)
        else 
            render :edit
        end
    end

    def destroy 
        @question.destroy
        redirect_to questions_path
    end

    private
    def question_params 
        params.require(:question).permit(:title, :body)
    end

    def find_question
        @question = Question.find params[:id]
    end
end
