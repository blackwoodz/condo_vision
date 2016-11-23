class ChangeAssessmentTypeDefaultValueInInvoices < ActiveRecord::Migration[5.0]
  def change
    change_column_default :invoices, :assessment_type, 'monthly'
  end
end
