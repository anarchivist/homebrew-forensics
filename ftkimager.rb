require 'formula'

class Ftkimager < Formula
  # binary only
  homepage 'http://www.accessdata.com/support/product-downloads'
  url 'https://ad-zip.s3.amazonaws.com/ftkimager%203.1.1_Mac.u.zip'
  version '3.1.1'
  sha1 '3e4c6911dec66d050a14939a3e0469434c9d56ee'

  def install
    bin.install 'ftkimager'
  end

  def test
    system "ftkimager"
  end
end
