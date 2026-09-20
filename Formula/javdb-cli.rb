class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.1/javdb-cli_0.8.1_darwin_arm64.tar.gz"
      sha256 "17fbd3a0ad77368f9e8a3f8a75ebf59c617ce2efefb896b7e3758f4c9b9f8ce2"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.1/javdb-cli_0.8.1_darwin_amd64.tar.gz"
      sha256 "4504cd71a36425a12ae9a283c685d908f096f7b428a8b42ab0c4df88e13ae85d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.1/javdb-cli_0.8.1_linux_arm64.tar.gz"
      sha256 "32e9773309bd17efa9ff359c1fe6c99b1e3f12c36bfc935552e3c5d49d75d7a3"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.1/javdb-cli_0.8.1_linux_amd64.tar.gz"
      sha256 "aa53b6a813f4ffd71f3a8be0976d5bc044e412203e417d35e37ff94d67bfbabb"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
