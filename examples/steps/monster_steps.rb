step "there is a monster called :name" do |name|
  @monster_name = name
end

step "I change its name to :name" do |name|
  @monster_name = name
end

step 'it should be called "Kijimuna"' do
  expect(@monster_name).to eq "Kijimuna"
end
