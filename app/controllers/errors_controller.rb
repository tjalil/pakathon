class ErrorsController < ApplicationController
  def file_not_found
    respond_to do |format|
      format.html { render template: 'errors/file_not_found', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def internal_server_error
    respond_to do |format|
      format.html { render template: 'errors/file_not_found', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500 }
    end
  end
end
