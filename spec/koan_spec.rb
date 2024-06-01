# spec/koans_spec.rb
require 'rails_helper'

RSpec.describe 'Koans', type: :request do
  it 'should pass all koans' do
    expect(system('ruby path/to/your/koans/test_file.rb')).to be_truthy
  end
end