module ValidReservation
    extend ActiveSupport::Concern

  def reservation_is_valid?
    time_booked.strftime('%d/%m/%Y') == Time.now.strftime('%d/%m/%Y') &&
    reserved
  end
end