class MusicDl < Formula
  desc "Music Searcher and Downloader"
  homepage "https://github.com/guanguans/music-dl"
  license "MIT"
  version "4.1.7"
  version_scheme 1

  url "https://raw.githubusercontent.com/guanguans/music-dl/master/builds/music-dl"
  sha256 "50155de55d2382b2b8214d0601f1d532c7f529b955d8d72abdf92d49a15b1e24"

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "music-dl"
  end
end
