# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Task.create(id: 0, title: 'О правилах курса', task_type: 'Описание раздела')
Task.create(id: 1, title: 'Синтаксис языка и типы данных', task_type: 'Описание задачи',parent_id: 0)
Task.create(id: 2, title: 'Объекты и классы', task_type: 'Описание задачи', parent_id: 1)
Task.create(id: 3, title: 'Замыкания', task_type: 'Описание задачи', parent_id: 2)
Task.create(id: 4, title: 'Лабораторные по TDD', task_type: 'Описание раздела', parent_id: 3 )
Task.create(id: 5, title: 'Лабораторная 1', task_type: 'Описание задачи', parent_id: 4)
Task.create(id: 6, title: 'Лабораторная 2', task_type: 'Описание  задачи', parent_id: 5)
Task.create(id: 7, title: 'Лабораторная 3', task_type: 'Описание  задачи', parent_id: 6)
Task.create(id: 8, title: 'Разработка гема', task_type: 'Описание  раздела', parent_id: 3)
Task.create(id: 9, title: 'Формулировка задачи', task_type: 'Описание задачи', parent_id: 8)
Task.create(id: 10, title: 'Первая демонстрация', task_type: 'Описание задачи', parent_id: 9)
Task.create(id: 11, title: 'Защита проекта', task_type: 'Описание задачи', parent_id: 10)