class HelloController < ApplicationController
  skip_before_filter :check_account, only: %i(revision)

  def revision
    rev_file = Rails.root.join('REVISION')
    status_code = 200
    if rev_file.exist?
      rev = File.read(rev_file).chomp
    else
      rev = 'REVISION_FILE_NOT_FOUND'
      status_code = 404
    end
    render text: rev, status: status_code
  end
end
