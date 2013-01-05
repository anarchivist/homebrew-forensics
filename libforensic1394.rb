require 'formula'

class Libforensic1394 < Formula
  homepage 'https://freddie.witherden.org/tools/libforensic1394/'
  url 'https://freddie.witherden.org/tools/libforensic1394/releases/libforensic1394-0.2.tar.gz'
  sha1 '179526652977c291303e4f7edc3c7ed487eb0eca'

  # TODO: Add option to build python bindings

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make install"
  end

end
