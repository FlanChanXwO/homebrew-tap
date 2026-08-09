class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.1/javdb-cli_0.5.1_darwin_arm64.tar.gz"
      sha256 "f30614dffd07331c05c7834035ef2450d20dcc07253094fe085c6796bd72f6e1"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.1/javdb-cli_0.5.1_darwin_amd64.tar.gz"
      sha256 "f9426274f04e932e6e29191eb8ea1baad9507065ce7faaa4d62a01be4e5cf914"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.1/javdb-cli_0.5.1_linux_arm64.tar.gz"
      sha256 "148ae21074c4411c8272314084314666076760d0092bdef5c29a7ff2826bfeba"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.1/javdb-cli_0.5.1_linux_amd64.tar.gz"
      sha256 "9d74795ea95193b492e14a03df0067dd048c590984ffce64e0517a2393019b48"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/javdb version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
