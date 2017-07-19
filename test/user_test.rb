require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")
    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")
    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")
    assert_equal "Ali", ali.name
  end

  def test_no_jokes_default
    sal = User.new("Sal")
    assert_equal [], sal.jokes
  end

  def test_it_can_take_a_joke
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the chicken cross the road?", answer: "To get to the other side"})
    sal.learn(joke)
    assert_instance_of Joke, sal.jokes[0]
  end

  def test_it_can_tell_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the chicken cross the road?", answer: "To get to the other side"})
    sal.tell(ali, joke)
    assert_instance_of Joke, ali.jokes[0]
    assert_equal 1, ali.jokes.count
  end

  def test_it_can_perform_routine
    josh = User.new("Josh")
    ilana = User.new("Ilana")
    joke1 = Joke.new({id: 1, question: "Why did the chicken cross the road?", answer: "To get to the other side"})
    joke2 = Joke.new({id: 2, question: "What did the bartender say to the horse when he walked in the bar?", answer: "Why the long face?"})
    josh.learn(joke1)
    ilana.learn(joke2)
    ilana.perform_routine_for(josh)
    assert_equal joke2, josh.jokes[0]
  end

  def test_it_can_download_routine
    casey = User.new("Casey")
    casey.learn_routine('./jokes.csv')
    assert_equal 100, casey.jokes.count
  end
end
