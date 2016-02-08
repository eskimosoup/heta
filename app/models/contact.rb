class Contact

	include ActiveModel::Validations
	include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :email, :message, :firstname, :lastname, :subject, :area, :form_type

  validates :firstname, :lastname, :email, :subject, :message, {:presence => true}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
