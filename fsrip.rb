require 'formula'

class Fsrip < Formula
  # head only; appears to need gcc 4.3+
  head 'https://github.com/jonstewart/fsrip.git'
  homepage 'http://github.com/jonstewart/fsrip'

  depends_on 'scons' => :build
  depends_on 'boost'
  depends_on 'sleuthkit'

  def install
    inreplace 'SConstruct' do |s|
      s.gsub! 'env.Replace(CCFLAGS=ccflags)', "env.MergeFlags(['#{ENV.cflags}', ccflags])"
    end

    system 'scons', 'boostType="-mt"'
    prefix.install %w{ LICENSE.txt HttpProtocol.txt README.txt hasher.py}
    bin.install 'build/src/fsrip' => 'fsrip'
  end

  def test
    system "fsrip"
  end
end