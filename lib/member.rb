require ('pry')

class Member
  @@members = []
  attr_reader(:first_name, :last_name, :specialization, :id)


  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @specialization = attributes.fetch(:specialization)
    @id = @@members.length().+(1)
  end

  define_singleton_method(:all) do
    @@members
  end

  define_method(:save) do
    @@members.push(self)
  end

  define_singleton_method(:clear) do
    @@members = []
  end

  define_singleton_method(:find) do |identification|
    found_member = nil
    @@members.each() do |member|
      if member.id().eql?(identification.to_i())
        found_member = member
      end
    end
    found_member
  end
end
