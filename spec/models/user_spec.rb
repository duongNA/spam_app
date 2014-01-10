require 'spec_helper'

describe User do
  before { @user = User.new(name: "test", emails: "test@mail.com", 
                password: "123456", password_confirmation: "123456") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:emails) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when emails is not present" do
  	before { @user.emails = " "}
  	it { should_not be_valid }
  end

  describe "when name is longer than 50 characters" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when emails format is invalid" do
    it "should not valid" do
      addresses = %w[duong.com duong@com]
      addresses.each do |address|
        @user.emails = address
        should_not be_valid      
      end
    end
  end

  describe "when emails already exists" do
    before {
      @user_with_same_emails = @user.dup
      @user_with_same_emails.emails = @user.emails.upcase
      @user_with_same_emails.save
    }

    it { should_not be_valid }
  end

  

  describe "when password is not present" do
    before {
      @user.password = " ";
      @user.password_confirmation = "1234";
    }

    it { should_not be_valid }
  end

  describe "when password and password confirmation not match" do
    before {
      @user.password = "123"
      @user.password_confirmation = "123456"
    }

    it { should_not be_valid }
  end

  describe "return when use authenticate method" do
    before { 
      @user.save
    }

    let (:user_to_test) { User.find_by_emails(@user.emails) }

    describe "with valid password" do
      it { should eq user_to_test.authenticate(@user.password) }
    end

    describe "with invalid password" do
      it { should_not eq user_to_test.authenticate("_invalid_") }
      specify { expect(user_to_test.authenticate("_invalid_")).to be_false }
    end
  end

  describe "with a too short password(less than 5)" do
    before {
      @user.password = @user.password_confirmation = "123"      
    }

    it { should_not be_valid }
  end
end

