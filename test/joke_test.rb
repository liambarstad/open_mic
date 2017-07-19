require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test
  def test_initialize
    joker = Joke.new({id: 1, question: "Why did the chicken cross the road?", answer: "To get to the other side"})
    assert_instance_of Joke, joker
  end

  def test_id
    joker = Joke.new({id: 1, question: "Why did the chicken cross the road?", answer: "To get to the other side"})
    assert_equal 1, joker.id
  end

  def test_question
    joker = Joke.new({id: 1, question: "Why did the chicken cross the road?", answer: "To get to the other side"})
    assert_equal "Why did the chicken cross the road?", joker.question
  end

  def test_answer
    joker = Joke.new({id: 1, question: "Why did the chicken cross the road?", answer: "To get to the other side"})
    assert_equal "To get to the other side", joker.answer
  end
end
