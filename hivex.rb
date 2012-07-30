require 'formula'

class Hivex < Formula
  homepage 'http://libguestfs.org/hivex.3.html'
  url 'http://libguestfs.org/download/hivex/hivex-1.3.6.tar.gz'
  sha1 'd3f89b854a36ac75b7db62096ad279f869294c0f'
  
  depends_on 'autoconf'
  depends_on 'automake'
  depends_on 'libtool'
  depends_on 'ocaml'
  depends_on 'pkgconfig'

  def install
    if MacOS.prefer_64_bit?
      ENV['ARCHFLAGS'] = "-arch i386 -arch x86_64"
    end
    # disable ruby bindings because of dumb build rules - FIXME
    system "./configure", "--prefix=#{prefix}", "--disable-ruby"
    # must run `make` before `make install` because of weird perl makefile 
    system "make"
    system "make install"
  end

  def caveats; <<-EOS.undent
    To use the Perl modules, make sure they are included in your PERL5LIB
    environment variable:
      export PERL5LIB=#{HOMEBREW_PREFIX}/lib/perl5/site_perl:${PERL5LIB}
    EOS
  end

  def test
    system "hivexml"
  end
end
