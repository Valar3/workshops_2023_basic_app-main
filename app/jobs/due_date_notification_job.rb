class DueDateNotificationJob
  include Sidekiq::Job
  def perform(book_loan_id)
    book_loan_id.each do |book_loan|
      book_loan.BookLoan.where(status: 'checked_out', due_date: Date.tomorrow)
    end
    UserMailer.due_date_notification_email(book_loan).deliver_now
  end
end
