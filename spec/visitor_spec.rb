describe Visitor do
  describe 'initialize' do

    it 'should create an instance of visitor containing an ip address' do
      ip = '184.123.665.067'
      page = '/contact'
      test_visitor = Visitor.new(page, ip)
      expect(test_visitor.ip).to eq('184.123.665.067')
    end

    it 'should create an instance of visitor containing a page' do
      ip = '184.123.665.067'
      page = '/contact'
      test_visitor = Visitor.new(page, ip)
      expect(test_visitor.page).to eq('/contact')
    end
  end
end
