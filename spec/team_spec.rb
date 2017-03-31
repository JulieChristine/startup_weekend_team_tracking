require('rspec')
require('team')
require('member')

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

    describe(".find") do
      it("returns a team by its id number") do
        test_team = Team.new({:name => "Cool Cool", :project => "shop application"})
        test_team.save()
        test_team2 = Team.new({:name => "Blackboard", :project => "Blackboard application for Accelerate HK"})
        test_team2.save()
        expect(Team.find(test_team.id())).to(eq(test_team))
      end
    end

    describe('#add_member') do
      it("adds a new member to a team") do
        test_team = Team.new({:name => "Blackboard", :project => "Blackboard application for Accelerate HK"})
        test_member = Member.new({:first_name => "Pace", :last_name => "Lee", :specialization => "developer"})
        test_team.add_member(test_member)
        expect(test_team.person()).to(eq([test_member]))
      end
    end

end
