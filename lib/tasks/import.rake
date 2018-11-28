require 'csv'

  namespace :import do
    desc "imports csv data"
      task all: :environment do
        CSV.foreach('./db/data/merchants.csv', headers: true) do |row|
          Merchant.create(row.to_h)
        end
        
        puts "created #{Merchant.count} merchants!"
        
        CSV.foreach('./db/data/customers.csv', headers: true) do |row|
          Customer.create(row.to_h)
        end
      
        puts "created #{Customer.count} customers!"
  
        CSV.foreach('./db/data/invoices.csv', headers: true) do |row|
          Invoice.create(row.to_h)
        end
    
        puts "created #{Invoice.count} invoices!"
    
        CSV.foreach('./db/data/items.csv', headers: true) do |row|
          Item.create(row.to_h)
        end
        
        puts "created #{Item.count} items!"
    
        CSV.foreach('./db/data/invoice_items.csv', headers: true) do |row|
          InvoiceItem.create(row.to_h)
        end
      
        puts " created #{InvoiceItem.count}invoice items!"
  
        CSV.foreach('./db/data/transactions.csv', headers: true, header_converters: :symbol) do |row|
          Transaction.create!(
          id:                           row[:id],
          invoice_id:                   row[:invoice_id],
          credit_card_number:           row[:credit_card_number],
          result:                       row[:result],
          created_at:                   row[:created_at],
          updated_at:                   row[:updated_at])
        end
      
      puts " created #{Transaction.count} transactions!"
    end
  end
