class User
  attr_reader :name, :jokes
  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    @jokes.each do |joke|
      user.jokes.unshift(joke)
    end
  end

  def learn_routine(filepath)
    File
end
