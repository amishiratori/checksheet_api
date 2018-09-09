require 'google/apis/sheets_v4'

credential_file = './auth.json'
  authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(credential_file),
      scope: Google::Apis::SheetsV4::AUTH_SPREADSHEETS
  )  
  authorizer.fetch_access_token!
  s_service = Google::Apis::SheetsV4::SheetsService.new
  s_service.authorization = authorizer
  for num in 1..47
    num = num.to_s
    data = s_service.batch_get_spreadsheet_values('1hZaEtaLftNxqHeeWUcgsJnAXLi5xXIQvdty36rBz1vE', ranges: 'prefecture!A' + num + ':C' + num).value_ranges.first.values
    Prefecture.create({
      name: data[0][0].delete(' '),
      capital: data[0][1].delete(' '),
      flower: data[0][2].delete(' ')
      })
  end