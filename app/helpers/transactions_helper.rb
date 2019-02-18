module TransactionsHelper
  class TransactionCollection
    attr_accessor :transactions, :user
    delegate :balance, :budget_in_dollars, to: :user

    def initialize(transactions, user)
      self.transactions = transactions
      self.user = user
    end

    def percent_of_budget
      @percent_of_budget ||= (spend.to_f / user.budget_in_dollars.to_f) * 100
    end

    def income_less_expenses
      @income_less_expenses ||= user.balance
    end

    def spend
      @spend ||= transactions.map(&:amount_in_dollars).sum
    end

    def balance_remaining
      @balance_remaining ||= user.balance - spend
    end
  end
end
