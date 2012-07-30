require 'formula'

class Ftkimager < Formula
  homepage 'http://accessdata.com/support/adownloads'
  url 'http://accessdata.com/downloads/current_releases/imager/FTK%20ImagerCLI%202.9.0_Mac.zip'
  version '2.9.0'
  sha1 '35185efb34579bc34fd3e777c29c934dfbdae22c'

  def install
    bin.install 'ftkimager'
  end

  def test
    system "false"
  end
end
