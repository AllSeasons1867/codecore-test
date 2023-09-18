class LikesController < ApplicationController
    before_action(:authenticate_user!)

    def create
        question = Question.find params[:question_id]
    
        like = Like.new(user: current_user, question: question)
    
        if like.save
          flash[:success] = "Question Liked! 💚"
        else
          flash[:danger] = "Already Liked... 🚫"
        end
        redirect_to question_path(question)
    end

    def destroy
        like = Like.find params[:id]
        like.destroy
    
        flash[:success] = "Question Unliked! 💔"
        redirect_to question_path(like.question)
    end
end
