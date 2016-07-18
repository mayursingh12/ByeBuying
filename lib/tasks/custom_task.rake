namespace :custom_task do

  desc "TODO"

  task create_states: :environment do
    states = CS.states(:in)

    states.each do |state|
      State.create(name: state[1], code: "#{state[0]}")
    end
  end

  task create_cities: :environment do

    CS.states(:in)

    states = State.all

    states.each do |state|
      cities = CS.cities(:"#{state.code}")

      cities.each do |city|
        City.create(name: city, state_id: state.id)
      end

    end

  end

end
