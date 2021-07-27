require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'new user should be valid' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test1234',
        password_confirmation: 'test1234'
      )
      expect(@user.valid?).to be true
    end

    it 'new user should not be valid if there is no first name' do
      @user = User.new(
        first_name: nil,
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test1234',
        password_confirmation: 'test1234'
      )
      expect(@user.valid?).to be false
    end

    it 'new user should not be valid if there is no last name' do
      @user = User.new(
        first_name: 'John',
        last_name: nil,
        email: 'test@test.com',
        password: 'test1234',
        password_confirmation: 'test1234'
      )
      expect(@user.valid?).to be false
    end

    it 'new user should not be valid if there is no email' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: 'test1234',
        password_confirmation: 'test1234'
      )
      expect(@user.valid?).to be false
    end

    it 'new user should not be valid with failed password confirmation' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test1234',
        password_confirmation: 'test123'
      )
      expect(@user.valid?).to be false
    end

    it 'new user should not be valid if same email exists' do
      @user1 = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test1234',
        password_confirmation: 'test1234'
      )
      @user1.save
      @user2 = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'TEST@TEST.com',
        password: 'test4321',
        password_confirmation: 'test4321'
      )
      expect(@user2.valid?).to be false
    end

    it 'new user should have valid password length' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test1234',
        password_confirmation: 'test1234'
      )
      expect(@user.password.length).to be 8
    end

    it 'new user should have invalid password length' do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(@user.valid?).to be false
    end

  end
end
