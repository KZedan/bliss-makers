describe Space do
  describe '.available_dates' do
    it 'creates an array of available dates' do
        expect(Space.available_dates).to eq '["2019-08-01", "2019-08-02", "2019-08-03"]'
    end
  end
end
