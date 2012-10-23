# encoding: UTF-8

class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :read, :subject
  
  validates :name, :presence => true
  validates :email, :presence => true, :email_format => {:message => "email inválido"}
  validates :subject, :presence => true
  validates :message, :presence => true 
end
