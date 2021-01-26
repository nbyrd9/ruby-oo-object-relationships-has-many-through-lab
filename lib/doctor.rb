class Doctor

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name, :appointments, :patients

    def initialize(name)
        @name = name
        @appointments = []
        @@all << self
    end

    def new_appointment(date, patient)
        appointment = Appointment.new(date, patient, self)
        @appointments << appointment 
        appointment
    end 

    def appointments
        Appointment.all.select { |appointment| appointment.doctor == self }
      end
      
    def patients
        @appointments.collect do |appt|
            appt.patient
        end
    end
end
