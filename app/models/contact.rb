class Contact

	include ActiveModel::Validations
	include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :email, :message, :firstname, :lastname, :phone_number, :subject, :area, :form_type

  validates :firstname, :lastname, :email, :subject, :phone_number, :message, {:presence => true}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
