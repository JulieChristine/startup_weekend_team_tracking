require ('pry')

class Team
  @@teams = []
  attr_reader(:name, :project, :id)


  define_method(:initialize) do |description|
    @name = description.fetch(:name)
    @project = description.fetch(:project)
    @id = @@teams.length().+(1)
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

  define_singleton_method(:find) do |identification|
    found_team = nil
    @@teams.each() do |team|
      if team.id().eql?(identification.to_i())
        found_team = team
      end
    end
    found_team
  end


end
