class CommentsController < ApplicationController
  # before_filter :ensure_logged_in, only: [:create, :destroy]
  before_filter :load_project
  
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @project.comments.build(
      title: "Comment by #{current_user.first_name}",
      description: params[:comment][:description],
      user: current_user
    )

    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_path(@project.id), notice: 'Comment added.' }
        format.js {}
      else
        format.html { render 'projects/show', alert: 'There was an error.'  }
        format.js {}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to projects_path, notice: "Comment Deleted!"
  end

  private
  def load_project
    @project = Project.find(params[:project_id])
  end
end
