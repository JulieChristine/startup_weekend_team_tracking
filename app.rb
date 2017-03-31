require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
# require('./lib/member')
require('./lib/team')
require('./lib/member')

get('/') do
  @teams = Team.all()
  erb(:index)
end

# to create a new team
get('/teams/new') do
  erb(:team_form)
end

get('/teams') do
  @teams = Team.all()
  erb(:teams)    #redirect to index?
end

post('/teams') do
  name = params.fetch('name')
  project = params.fetch('project')
  Team.new({:name => name, :project => project}).save()
  @teams = Team.all()
  erb(:success_team)     #redirect to index possible?
end

get('/teams/:id') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:team)
end

get('/teams/:id/members/new') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:member_form)
end


# get('/members/:id') do
#   @members = Member.find(params.fetch('id').to_i())
#   erb(:member)
# end


post('/members') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  specialization = params.fetch('specialization')
  @member = Member.new({:first_name => first_name, :last_name => last_name, :specialization => specialization})
  @member.save()
  @team = Team.find(params.fetch('team_id').to_i())
  @team.add_member(@member)
  erb(:success_member)
end
