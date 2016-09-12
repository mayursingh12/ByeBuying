namespace :enquiries do
  task check_endings: :environment do

    Enquiry.where(status: Enquiry::STATUS_CONFIRMED).where(
        'end_at BETWEEN ? AND ?', DateTime.now, DateTime.now + 24.hours
    ).each do |enquiry|
      UserMailer.enquiry_ending(enquiry).deliver_later(wait_until: enquiry.end_at + 1.hour)
    end

  end
end