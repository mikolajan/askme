require 'sklonenie'

module ApplicationHelper
  def user_avatar(user)
    user.avatar_url || asset_path('no_avatar.jpg')
  end

  def user_questions_count(number_of_question, text_if_null, text_if_not_null)
    number_of_question.zero? ? text_if_null :text_if_not_null + ' ' +
    Sklonenie.sklonenie(number_of_question, 'вопрос', 'вопроса', 'вопросов', number_of_question)
  end
end
