require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
# require('./lib/member')
require('./lib/team')

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
