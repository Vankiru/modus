class Scoring < Modus::Engine
  variable :ltc do |loan|
    # 25 pts added to ARV LTV if 100% complete refinance
    loan.refinance? && loan.repairs_completed? ? 0 : loan.ltc
  end

  variable :ltv do |loan|
    # 15 pts added to ARV LTV if 100% complete refinance
    loan.refinance? && loan.repairs_completed? ? 0 : loan.ltv
  end

  variable :arv_ltv

  variable :purpose do |loan|
    if loan.purchase?
      'purchase'
    elsif loan.repairs_completed?
      'refinance_repairs_completed'
    elsif loan.existing_amount.positive?
      'refinance_existing_lender'
    else
      'refinance_cash_purchase'
    end
  end

  variable :total_amount


  rules do
    ltc: :range
    ltv: :range
    arv_ltv: :range
    purpose: :range
    total_amount: :range
  end
end
