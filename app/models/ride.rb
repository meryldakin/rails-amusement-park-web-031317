class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    find_user
    find_attraction
    if tall_enough && enough_tickets
      update_stats
      thank_you_message
    else
      sorry_message
    end
  end

  def find_user
    @user = User.find(self.user_id)
  end

  def find_attraction
    @attraction = Attraction.find(self.attraction_id)
  end

  def thank_you_message
    "Thanks for riding the #{attraction.name}!"
  end

  def sorry_message
    if !tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif !tall_enough
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    end
  end

  def enough_tickets
    @user.tickets >= @attraction.tickets
  end

  def tall_enough
    @user.height >= @attraction.min_height
  end

  def update_stats
    @user.tickets -= @attraction.tickets
    @user.nausea += @attraction.nausea_rating
    @user.happiness += @attraction.happiness_rating
    @user.save
  end

end
