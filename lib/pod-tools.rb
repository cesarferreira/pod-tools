require 'version'
require 'colorize'

module PodTools

  # Remove a file
  def self.remove_file(path)
    puts "  #{path.green}"
    to_remove = "rm -rf #{path}"
    FileUtils.rm_rf("#{path}", secure: true)
  end

  # Reinstall Pods
  def self.reinstall(path)
    puts 'Reinstalling pods...'
    `pod install`

  end

  # Delete all derived data
  def self.delete_derived_data
    puts 'Cleaning derived data...'
    deletion = `rm -rf ~/Library/Developer/Xcode/DerivedData/*`
    puts '  Derived data deleted!'.green
  end

  # Remove Cocoapods' files
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

  # Delete podfiles
  def self.delete_podfiles(current_path)

    # Check if you are on a project with Podfile
    bool = File.exist?("#{current_path}/Podfile")

    unless bool
      puts "You're not on a XCode project...".red
      exit 1
    end

    remove_podfiles(current_path)

  end
end
