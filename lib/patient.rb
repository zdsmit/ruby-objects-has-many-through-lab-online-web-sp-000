class Patient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(date, doctor)
    Appointment.new(doctor, self, date)
  end

  def appointments
    Appointment.all.select {|appointment|appointment.patient == self}
  end

  def doctors
    appointments.map(&:doctor)
  end

end
