require 'formula'

class Hivex < Formula
  homepage 'http://libguestfs.org/hivex.3.html'
  url 'http://libguestfs.org/download/hivex/hivex-1.3.11.tar.gz'
  # FIXME: HEAD builds are currently broken :/
  head 'https://github.com/libguestfs/hivex.git'
  sha1 '27861b1b72835647d57cf32fb6830f7d7282bae7'
  
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'gettext' => :build
  depends_on 'libtool' => :build
  depends_on 'ocaml'
  depends_on 'pkgconfig' => :build
  depends_on :python
  depends_on 'readline' => :recommended

  option "with-python", "Install Python bindings"
  option "with-ruby", "Install Ruby bindings"

  def install
    ENV.append "LDFLAGS", "-L#{Formula["readline"].opt_lib} -lreadline" if build.with? "readline"
    if MacOS.prefer_64_bit?
      ENV['ARCHFLAGS'] = "-arch i386 -arch x86_64"
    end

    args = [ "--prefix=#{prefix}" ]
    args << "--with-readline" if build.with? "readline"
    args << "--enable-python" if build.with? "python"
    args << "--disable-ruby" if build.without? "ruby"

    if build.head?
      system "./bootstrap"
    end

    system "./configure", *args
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
