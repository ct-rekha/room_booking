require 'elasticsearch'
require 'pry'
require 'spreadsheet'

class count
  def initialize
    @rem_conn = Elasticsearch::Client.new host: "18.207.254.231:9200" , request_timeout: 60, retry_on_failure: true, log: false
    @loc_conn = Elasticsearch::Client.new host: "localhost:9200" , request_timeout: 60, retry_on_failure: true, log: false
  end

  name = spreadsheet.open '/home/data-team/Desktop.CT list.xlsx'

  name.each do |i|
    p i
  end