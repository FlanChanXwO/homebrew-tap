class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_darwin_arm64.tar.gz"
      sha256 "a3d500b5e2137880b4e61d4ac8475bbc78abdd8a041ef082de5a0da143b1114d"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_darwin_amd64.tar.gz"
      sha256 "45d257c4f64236c3a4cbc440b1dc2e56c9b462340e114654df7db5f9710a99c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_linux_arm64.tar.gz"
      sha256 "11fcb7187a780178b8273775de18d7d33b9c79e145e900a2e176c7c09a74484a"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.2/javdb-cli_0.7.2_linux_amd64.tar.gz"
      sha256 "598bfc535db39e9696885bbba5cd93fa19783517fdec7dadd100691a4e3ea141"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
