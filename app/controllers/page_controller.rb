class PageController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_path, only: [:index,:file_edit]
  before_action :file_save_valid, only: [:file_save]
  def index
    @is_readable = readable || ""
    @data = refresh_data
    @current_path = params[:path] || ""
  end

  def file_edit
    @is_readable = readable || ""
  end

  def file_preview
    @body = params[:body].gsub("\r","")
    @path = params[:path]
  end

  def file_save
    file = File.new(params[:path],'w')
    file.write params[:data]
    file.close
    redirect_to page_index_path,notice:"success"
  end
private
  def file_save_valid
    #add your valid here
  end

  def refresh_data
    data = []
    files = `ls #{@path}`
    files.split("\n").each do |file|
      data << "#{file}"
    end
    data
  end

  def readable
    data = ""
    data = `cat #{@path}`
    data
  end

  def cmd(input)
  end

  def set_path
    if params[:path]
      raise if params[:path].include?("..") 
    end
    @path = Dir.pwd
    @path += params[:path] if params[:path]
  end
end
