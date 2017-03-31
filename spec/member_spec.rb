require('rspec')
require('member')

describe(Member) do
  before() do
    Member.clear()
  end

    describe("#first_name") do
      it("returns the first name of the team member") do
        test_member = Member.new({:first_name => "Pace", :last_name => "Lee", :specialization => "developer"})
        expect(test_member.first_name()).to(eq("Pace"))
      end
    end

    describe("#last_name") do
      it("returns the last name of the team member") do
        test_member = Member.new({:first_name => "Pace", :last_name => "Lee", :specialization => "developer"})
        expect(test_member.last_name()).to(eq("Lee"))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Member.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a member to the array of saved members") do
        test_member = Member.new({:first_name => "Pace", :last_name => "Lee", :specialization => "developer"})
        test_member.save()
        expect(Member.all()).to(eq([test_member]))
      end
    end

    describe(".clear") do
      it("empties out all of the saved members") do
        Member.new({:first_name => "Pace", :last_name => "Lee", :specialization => "developer"}).save()
        Member.clear()
        expect(Member.all()).to(eq([]))
      end
    end

    describe(".find") do
      it("returns a member by its id number") do
        test_member = Member.new({:first_name => "Pace", :last_name => "Lee", :specialization => "developer"})
        test_member.save()
        test_member2 = Member.new({:first_name => "Samantha", :last_name => "Lace", :specialization => "sales"})
        test_member2.save()
        expect(Member.find(test_member.id())).to(eq(test_member))
      end
    end

end
