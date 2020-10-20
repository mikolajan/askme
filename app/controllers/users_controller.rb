class UsersController < ApplicationController
  def index
    # @users = [
    #   User.new(
    #     id: 1,
    #     name: 'Nick',
    #     username: 'mikolajan',
    #     avatar_url: 'https://via.placeholder.com/300x300'
    #   ),
    #   User.new(
    #     id: 2,
    #     name: 'Vadim',
    #     username: 'aristofun'
    #   )
    # ]
        @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Nick',
      username: 'mikolajan',
      avatar_url: 'https://via.placeholder.com/300x300'
    )
    @questions = [
      Question.new(text: 'Чем занимаешься?', answer: 'Кодю, учу rails', created_at: Date.parse('9.10.2020')),
      Question.new(text: 'Чем займёмся после вебинара?', created_at: Date.parse('9.10.2020'))
    ]

    @new_question = Question.new
  end
end
