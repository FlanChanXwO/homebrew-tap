class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.0/javdb-cli_0.5.0_darwin_arm64.tar.gz"
      sha256 "bf07f19001cfaf31d5c71162610eaee10985a6a04ea05b757d1069f39018ac46"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.0/javdb-cli_0.5.0_darwin_amd64.tar.gz"
      sha256 "4234034c067cbaea3413f82d4e51d53d2d0b178d467b5f8f5d60ed8a423c61b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.0/javdb-cli_0.5.0_linux_arm64.tar.gz"
      sha256 "f6b5927fa2b1389deb1e099428c0be5f3105335b0cb400af170b5f78499f8a8b"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.5.0/javdb-cli_0.5.0_linux_amd64.tar.gz"
      sha256 "23cd1ada989040573705c55a7123fc51a1f000d15ad0a032dc01c18d39879ca0"
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
