require 'pry'
class Transfer

    attr_reader :sender, :receiver, :amount
    attr_accessor  :status

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver 
        @status = "pending"
        @amount = amount
    end

    def valid?
      self.sender.valid? && self.receiver.valid? ? true : false
    end 

    def execute_transaction
      if self.status == "pending" && self.sender.balance >= self.amount && self.valid?
        self.sender.balance -= amount
        self.receiver.balance += amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
       
    def  reverse_transfer
      if self.status == "complete"
        self.receiver.balance -= amount
        self.sender.balance += amount
        self.status = "reversed"
        # binding.pry 
      end 
    end 
end



    
       




     
   




