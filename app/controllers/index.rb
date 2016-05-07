#Note -- AR does the below behind the scene; RethinkDB has 3rd parties who've developed libraries (e.g., Dash in JS), RethinkDB is working on this

before do
    @conn = r.connect(:host => "localhost")
end

after do
    @conn.close if @conn
end

#Routes:

get '/fellowship' do

	# r.table("fellowship").run(@conn).to_a.to_json

	@fellows = r.table("fellowship").run(@conn).to_a

	erb :fellowship

end

# get '/fellowship/:species' do 

# 	#filter works like select

# 	@fellows = r.table("fellowship").filter {|row| row["species"].eq(params[:species].capitalize)}.run(@conn).to_a

# 	erb :fellowship

# end

# get '/aww' do 

# 	# @aww = r.http("reddit.com/r/aww.json")["data"]["children"]["data"].pluck("title","score","thumbnail").order_by(r.desc("score")).limit(3).run(@conn).to_a

# 	#json view
# 	@aww = r.table("fellowship")["aww"].run(@conn).to_a.to_json

# 	#erb view
# 	@aww = r.table("fellowship")["aww"].run(@conn).to_a[0]

# 	erb :aww

# end
