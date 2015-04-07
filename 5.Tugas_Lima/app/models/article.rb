require 'acts_as_xlsx'
class Article < ActiveRecord::Base
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :content, presence:true,
            length: { minimum: 10 }
  validates :status, presence: true 
  
  has_many :comments, dependent: :destroy
 
 acts_as_xlsx columns: [:id, :title, :content, :status]


 def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    article = find_by_id(row["id"]) || new
    article.attributes = row.to_hash
    article.save!
  end
 end
 
def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when '.csv' then Csv.new(file.path, nil, :ignore)
  when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
  when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end
