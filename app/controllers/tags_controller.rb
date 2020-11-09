class TagsController < ApplicationController
  def show
    @tag = Tag.with_questions.find_by!(name: params[:name])

    @questions = @tag.questions
  end
end
