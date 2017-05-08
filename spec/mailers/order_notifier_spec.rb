require 'rails_helper'

RSpec.describe OrderNotifierMailer, type: :mailer do
  fixtures :orders
  describe 'received' do
    let(:mail) { OrderNotifierMailer.received(orders(:one)) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Home Depot order confirmation')
      expect(mail.to).to eq(['jose@example.org'])
      expect(mail.from).to eq(['home.depot@email.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(/1 x Programming Ruby/)
    end
  end

  describe 'shipped' do
    let(:mail) { OrderNotifierMailer.shipped(orders(:one)) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Home Depot order shipped')
      expect(mail.to).to eq(['jose@example.org'])
      expect(mail.from).to eq(['home.depot@email.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(/<td>1&times;<\/td>\s*<td>Programming Ruby<\/td>/)
    end
  end

end
