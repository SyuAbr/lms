class User < ApplicationRecord
  has_secure_password
  has_many :permissions
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :surname, presence: true
  validates :name, presence: true

  def current_tasks
    permissions.map do |permission|
      {
        id: permission.task.id,
        name: permission.task.title,
        type: permission.task.task_type,
        parent_id: permission.task.parent_id,
        status: permission.status
      }
    end
  end
end
