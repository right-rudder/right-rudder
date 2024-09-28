module RandomId
  extend ActiveSupport::Concern

  included do
    before_validation :randomize_id, on: :create
    validates :random_id, uniqueness: true
  end

  class_methods do
    def findr(random_id)
      find_by(random_id:)
    end

    def findr!(random_id)
      find_by!(random_id:)
    end
  end

  def to_param
    random_id
  end

  def randomize_id
    begin
      self.random_id = generate_random_id
    end while self.class.where(random_id: self.random_id).exists?
  end

  def generate_random_id
    "#{random_id_prefix}_#{SecureRandom.alphanumeric(8)}".downcase
  end

  def random_id_prefix
    self.class.name.first(2).downcase
  end
end
