class UserCreationJob < ApplicationJob
  queue_as :default

  def perform(user_params)
    user = User.new(user_params)
    if user.save
      Task.all.each do |task|
        Permission.create(user_id: user.id, task_id: task.id, status: 'blocked')
      end
      return { success: true, user_id: user.id }
    else
      return { success: false, errors: user.errors.full_messages }
    end
  end
end
