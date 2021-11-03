class AnalysisController < ApplicationController
  def show
    now=Date.today

    tmp=Account.where(
      "(date >= ?) AND (income_or_payment=?)",now.at_beginning_of_month,'payment'
      )
    
    @payment=tmp.sum(:amount)
    tmp=Account.where(
      "(date >= ?) AND (income_or_payment=?)",now.at_beginning_of_month,'income'
      )
    @income=tmp.sum(:amount)
    @account=@income-@payment
  end
  
  def payment
    now=Date.today

    @payment=Account.where(
      "(date >= ?) AND (income_or_payment=?)",now.at_beginning_of_month,'payment'
      ).order('date DESC')
      
  end

  def income
    now=Date.today

    @income=Account.where(
      "(date >= ?) AND (income_or_payment=?)",now.at_beginning_of_month,'income'
      ).order('date DESC')
  end
end
