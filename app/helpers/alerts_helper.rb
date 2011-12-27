module AlertsHelper

  def alert_dispaly_status(display_status)
    if display_status == false
       "Myself"
    else
      "All"
    end
  end

end
