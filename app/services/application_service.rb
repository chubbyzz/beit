class ApplicationService
  def initialize
    @print_errors = lambda {|attribute, error| puts "#{attribute}: #{error}"}
  end
end