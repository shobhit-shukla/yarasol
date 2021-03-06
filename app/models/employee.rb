# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  middle_name            :string
#  last_name              :string
#  address_id             :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  type                   :string
#  secondary_phone        :string
#  phone                  :string
#  avatar                 :string
#  parent_id              :integer
#  uid                    :string
#

class Employee < User
  has_one :employee_detail
  accepts_nested_attributes_for :employee_detail
end
