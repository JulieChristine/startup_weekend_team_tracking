require ('pry')

class Team
  @@teams = []
  attr_reader(:name, :project)


  define_method(:initialize) do |description|
    @name = description.fetch(:name)
    @project = description.fetch(:project)

  end
end
