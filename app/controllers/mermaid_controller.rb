class MermaidController < ApplicationController
  include MermaidHelper

  before_action :authenticate_user!

  def index
    @mermaid_chart = generate_mermaid1( @current_user.current_tasks,@current_user)
  end
end
