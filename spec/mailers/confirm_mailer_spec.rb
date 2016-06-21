require "rails_helper"

RSpec.describe ConfirmMailer, type: :mailer do
  describe "sendmail_inquiry" do
    let(:mail) { ConfirmMailer.sendmail_inquiry }

    it "renders the headers" do
      expect(mail.subject).to eq("Sendmail inquiry")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
