class MP3Importer
  attr_reader :path  #don't want path to be fully accessible outside of the class.
                     #shorter run time?

  def initialize(path)
    @path = path
  end

  def files  #collect method transform each element of collection into something else and end up with an array.
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end  #gsub replacing matched portion of string with the result of the block.
  # ||= what comes after is executed if @files returns a non false value. 

  def import
    files.each{|f|
    Song.new_by_filename(f)}
  end

end
