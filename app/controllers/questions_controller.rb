class QuestionsController < ApplicationController
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
        @question = Question.find params[:id]
    end

    private
    def question_params 
        params.require(:question).permit(:title, :body)
    end
end