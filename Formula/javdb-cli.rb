class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.0/javdb-cli_0.8.0_darwin_arm64.tar.gz"
      sha256 "f1689c10f587a9b80de1956aeaf05145a7110a16eae6802531ea0c5129c10630"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.0/javdb-cli_0.8.0_darwin_amd64.tar.gz"
      sha256 "4b7519b52314716b638c2b62d0541a678e7ba5316614e13d05d3ecae03f02fbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.0/javdb-cli_0.8.0_linux_arm64.tar.gz"
      sha256 "50e85e0274f5fb9c85e33e18da17dbcda05cc58278a0836fc592a77b78ac3b54"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.8.0/javdb-cli_0.8.0_linux_amd64.tar.gz"
      sha256 "89929071af336cc793ee5692b7efe342e7842c2f765652b0fef0e856f21be4ef"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    assert_match "javdb version #{version}", shell_output("#{bin}/javdb --version")
  end
end
