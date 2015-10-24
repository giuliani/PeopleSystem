require 'minitest/autorun'

class PersonTest < Minitest::Test

  def setup
    @person = create(:person)
  end

end
