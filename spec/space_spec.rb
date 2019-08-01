describe Space do
  describe '.available_dates' do


    space = Space.create(
      :space_name => "Central appartment",
      :description => "close to the station",
      :price => "50",
      :user_id => "1",
      :available_from => "2019-08-01",
      :available_to => "2019-08-03"
    )

    it 'creates an array of available dates' do
        expect(space.available_dates).to eq ["2019-08-01", "2019-08-02"]
    end
  end
end
