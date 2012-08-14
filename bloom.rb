require 'formula'

class Bloom < Formula
  homepage 'http://afflib.org/'
  url 'http://afflib.org/downloads/bloom-1.4.6.tar.gz'
  sha1 '0c721d96f64e63f03c13ce76eb9415624bf2b0e8'

  depends_on "openssl"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/demo_bloom"
  end
end
