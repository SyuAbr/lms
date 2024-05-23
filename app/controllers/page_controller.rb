class PageController < ApplicationController
  def start

  end
  def koans

  end
  def run_koans_tests
    result = system('bundle exec rspec spec/koans_spec.rb')
    @test_result = result ? 'Все тесты прошли успешно!' : 'Некоторые тесты не прошли.'
    render :koans
  end
end
