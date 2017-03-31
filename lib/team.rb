require ('pry')

class Team
  @@teams = []
  attr_reader(:name, :project)


  define_method(:initialize) do |description|
    @name = description.fetch(:name)
    @project = description.fetch(:project)
  end

  define_singleton_method(:all) do
    @@teams
  end

  define_method(:save) do
    @@teams.push(self)
  end

  define_singleton_method(:clear) do
    @@teams = []
  end
end
