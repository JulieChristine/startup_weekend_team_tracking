require('rspec')
require('team')

describe(Team) do
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
end
