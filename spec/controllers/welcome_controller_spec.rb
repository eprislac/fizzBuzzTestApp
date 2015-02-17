require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }

  describe "GET get_fizbuzz" do

    it "should return 'Buzz' for multiples of 3" do
      get 'get_fizzbuzz', number: 3
      expect(json.word).to eq("Buzz")
    end

    it "should return 'Fizz' for multiples of 5" do
      get 'get_fizzbuzz', number: 5
      expect(json.word).to eq("Fizz")
    end

    it "should return 'FizzBuzz' for multiples of 3 & 5" do
      get 'get_fizzbuzz', number: 15
      expect(json.word).to eq("FizzBuzz")
    end

  end

end