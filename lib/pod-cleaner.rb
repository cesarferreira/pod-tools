require 'version'
require 'rubygems'
require 'uri'
require 'colorize'

module PodCleaner

  def self.remove_file(path)
    puts "  #{path.green}"
    to_remove = "rm -rf #{path}"
    FileUtils.rm_rf("#{path}", secure: true)
  end

  def self.reinstall(path)
    puts 'Reinstalling pods...'
    `pod install`

  end

  def self.delete_derived_data
    puts 'Cleaning derived data...'
    deletion = `rm -rf ~/Library/Developer/Xcode/DerivedData/*`
    puts '  Derived data deleted!'.green
  end

  def self.remove_podfiles(path)
    puts 'Cleaning Podfile related data...'

    # add items
    disposables = Array.new

    disposables << 'Podfile.lock'
    disposables << 'Pods/'
    disposables << '*.xcworkspace'

    # Iterate the disposables
    disposables.each do |item|
      full_path = "#{path}/#{item}"
      # remove item
      remove_file (full_path)
    end
  end

  # INIT
  def self.init(current_path)

    # todo check if file exists
    bool = File.exist?("#{current_path}/Podfile")

    unless bool
      puts "you're not on a XCode project".red
      exit 1
    end

    remove_podfiles(current_path)

  end
end
