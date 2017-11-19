class MP3Importer
  attr_reader :path  #don't want path to be fully accessible outside of the class.
                     #shorter run time? 

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|f|
    Song.new_by_filename(f)}
  end

end
