module ValidReservation
    extend ActiveSupport::Concern

  def reservation_is_valid?
    if time_booked
      time_booked.strftime('%d/%m/%Y') == Time.now.strftime('%d/%m/%Y')
    end
  end
end