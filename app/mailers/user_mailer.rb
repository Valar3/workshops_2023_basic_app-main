class UserMailer < ApplicationMailer
  def loan_created_email(book_loan)
    @title = book_loan.book.title
    @due_date = book_loan.due_date
    @email = book_loan.user.email
    mail(to: @email, subject: 'Your book is due!!! ')
  end

  def due_date_notification_email
    @title = book_loan.book.title
    @due_date = book_loan.due_date
    @email = book_loan.user.email
    mail(to: @email, subject: 'Your book is due!!! TOMORROW ')
  end
end
