require('rspec')
require('team')

describe(Team) do
  before() do
    Team.clear()
  end

    describe("#name") do
      it("returns the name of the team") do
        test_team = Team.new({:name => "Cool Cool", :project => "shop application"})
        expect(test_team.name()).to(eq("Cool Cool"))
      end
    end

    describe("#project") do
      it("returns the project the team is working on") do
        test_team = Team.new({:name => "Cool Cool", :project => "shop application"})
        expect(test_team.project()).to(eq("shop application"))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Team.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a team to the array of saved teams") do
        test_team = Team.new({:name => "Cool Cool", :project => "shop application"})
        test_team.save()
        expect(Team.all()).to(eq([test_team]))
      end
    end

    describe(".clear") do
      it("empties out all of the saved teams") do
        Team.new({:name => "Cool Cool", :project => "shop application"}).save()
        Team.clear()
        expect(Team.all()).to(eq([]))
      end
    end

end
