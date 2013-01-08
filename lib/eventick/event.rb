class Eventick::Event
  URI = URI('http://eventick.com.br/api/v1/events.json')

  attr_accessor :id, :start_at, :title, :tickets

  def initialize(args={})
    # ?auth_token=f9d93dk211394
  end

  def self.build(params={})
    inst = new
    params.each do |key, value|
      inst.public_send("#{key}=", value)
    end if params
    inst
  end

  def self.all
    events_response = Eventick.request URI, auth_token
    events_response.map { |event_response| self.build event_response }
  end

private
  def self.auth_token
    { :auth_token => Eventick.auth_token }
  end
end