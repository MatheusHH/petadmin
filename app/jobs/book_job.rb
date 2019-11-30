class BookJob < ApplicationJob
  queue_as :emails

  def perform(client)
    BookMailer.confirm(client).deliver_now
  end
end
