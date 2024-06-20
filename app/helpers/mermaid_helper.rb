module MermaidHelper
  def generate_mermaid(data, initial_nesting = 3)
       tree = {
         name: "О правилах курса",
         type: :section_start,
         status: :completed,
         children: [
           {
             name: "Синтаксис языка и типы данных",
             type: :task,
             status: :completed,
             children: [
               {
                 name: "Объекты и классы",
                 type: :task,
                 status: :completed,
                 children: [
                   {
                     name: "Замыкания",
                     type: :task,
                     status: :completed,
                     children: [
                       {
                         name: "Лабораторные по TDD",
                         type: :section_start,
                         status: :open,
                         children: [
                           {
                             name: "Лабораторная 1",
                             type: :task,
                             status: :blocked
                           },
                           {
                             name: "Лабораторная 2",
                             type: :task,
                             status: :blocked
                           },
                           {
                             name: "Лабораторная 3",
                             type: :task,
                             status: :blocked
                           }
                         ]
                       },
                       {
                         name: "Разработка гема",
                         type: :section_start,
                         status: :open,
                         children: [
                           {
                             name: "Формулировка задачи",
                             type: :task,
                             status: :blocked,
                             children: [
                               {
                                 name: "Первая демонстрация",
                                 type: :task,
                                 status: :blocked,
                                 children: [
                                   {
                                     name: "Защита проекта",
                                     type: :task,
                                     status: :blocked
                                   }
                                 ]
                               }
                             ]
                           }
                         ]
                       }
                     ]
                   }
                 ]
               }
             ]
           }
         ]
       }
       traverse_tree(tree, initial_nesting).join("\n")
     end


  def generate_mermaid1(data, user)
    tree = build_user_tree(data, user)
    puts "Tree: #{tree.inspect}"
    traverse_tree(tree, 3).join("\n")
  end

  def traverse_tree(node, nesting_level = 0, result = [])
    puts "Node: #{node.inspect}, Nesting level: #{nesting_level}, Result: #{result.inspect}"
    if result.empty?
      result += root(node[:name], nesting_level)
    else
      result.concat(build_node(node[:type], node[:name], nesting_level, status: node[:status]))
    end

    if node[:children]
      node[:children].each do |child|
        self.traverse_tree(child, nesting_level + 1, result)
      end
    end

    result
  end

  def root(name, nesting_level=0)
    puts "Root name: #{name}, Nesting level: #{nesting_level}"
    ["mindmap",  "  "*nesting_level + "root(#{name})", styles(nesting_level, :open)]
  end


  def build_node(node_type, name, nesting_level, status: :blocked)
    case node_type
    when :section_start
      ["  "*nesting_level + "(#{name})", styles(nesting_level, status)]
    when :task
      ["  "*nesting_level + "{{#{name}}}", styles(nesting_level, status)]
    else
      raise RuntimeError.new("Unknown node type: #{node_type}")
    end

  end
  def styles(nesting_level, status)
    "  "*nesting_level + ":::" + status.to_s
  end
  private
  #  def generate_mermaid1(data, user)
  # tree = build_user_tree(data, user)
  # traverse_tree(tree, 3).join("\n")
  #end

  def build_user_tree(data,user)
    task_first=data[0]
    {
      name: task_first[:name],
      type:  task_first[:type],
      status: task_first[:status],
      children: build_children(data, task_first[:id])
    }
  end

  def build_children(data, parent_id)
    children = data.select { |item| item[:parent_id] == parent_id }
    children.map do |child|
      {
        name: child[:name],
        type: :task,
        status: child[:status].to_sym,
        children: build_children(data, child[:id])
      }
    end
  end

end

