class BookMailer < ApplicationMailer

  def confirm(book)
    @client = book.client.name
  	@description = book.description
    mail to: book.client.email, subject: "Confirmation"
  end
end
