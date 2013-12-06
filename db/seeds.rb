# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

states = State.create([{state: 'AL'}, {state: 'AK'}, {state: 'AZ'}, {state: 'AR'}, {state: 'CA'},
	{state: 'CO'}, {state: 'CT'}, {state: 'DE'}, {state: 'DC'}, {state: 'FL'}, {state: 'GA'}, {state:'HI'},
	{state: 'ID'}, {state: 'IL'}, {state: 'IN'}, {state: 'IA'}, {state: 'KS'}, {state: 'KY'}, 
	{state: 'LA'}, {state: 'ME'}, {state: 'MD'}, {state: 'MA'}, {state: 'MI'}, {state: 'MN'}, 
	{state: 'MS'}, {state: 'MO'}, {state: 'MT'}, {state: 'NE'}, {state: 'NV'}, {state: 'NH'}, 
	{state: 'NJ'}, {state: 'NM'}, {state: 'NM'}, {state: 'NY'}, {state: 'NC'}, {state: 'ND'}, 
	{state: 'OH'}, {state: 'OK'}, {state: 'OR'}, {state: 'PA'}, {state: 'RI'},
	{state: 'SC'}, {state: 'SD'}, {state: 'TN'}, {state: 'TX'}, {state: 'UT'}, {state: 'VT'},
	{state: 'VA'}, {state: 'WA'}, {state: 'WV'}, {state: 'WI'}, {state: 'WY'}])


categories = Category.create([{name: 'Appliances'}, {name: 'Couches'}, {name: 'Chairs'}, {name: 'Tables'},
	{name: 'Storage'}, {name: 'Beds'}, {name: 'Lights'},  {name: 'Textiles'} ])
