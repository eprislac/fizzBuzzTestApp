require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }

  describe "GET get_fizbuzz" do

    it "should return 'Buzz' for multiples of 3" do
      get 'get_fizzbuzz', format: :json, number: 3
      expect(json["word"]).to eq("Fizz")
    end

    it "should return 'Fizz' for multiples of 5" do
      get 'get_fizzbuzz', format: :json, number: 5
      expect(json["word"]).to eq("Buzz")
    end

    it "should return 'FizzBuzz' for multiples of 3 & 5" do
      get 'get_fizzbuzz', format: :json, number: 15
      expect(json["word"]).to eq("FizzBuzz")
    end

    it "should return an empty string for numbers that are not multiples of 3 & 5" do
      get 'get_fizzbuzz', format: :json, number: 2
      expect(json["word"]).to eq("")
    end

    it "should return '(404) not found' for invalid characters" do
      get 'get_fizzbuzz', format: :json, number: "A"
      expect(response.status).to eq(404)
    end



  end

end