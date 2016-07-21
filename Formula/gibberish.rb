class Gibberish < Formula
  desc "Generate '.strings' file with long gibberish strings in order to test UI with unexpected length"
  homepage "https://github.com/mlachmish/gibberish"
  url "https://github.com/mlachmish/gibberish/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "cd7004947e175d6a2ef3146fce1e07b48a791d55f80094ec50c4a43171d81a1a"


  def install
  
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])  

  end

  test do
    system "#{bin}/gibberish"
  end
end
