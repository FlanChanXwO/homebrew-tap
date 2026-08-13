class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.1/javdb-cli_0.6.1_darwin_arm64.tar.gz"
      sha256 "f381eed23e9ee0907be8c05edc1d8122cb0f3ec8b928ff4ca2c2ad0ad7b7e45a"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.1/javdb-cli_0.6.1_darwin_amd64.tar.gz"
      sha256 "6e49559214244a252c296c57dabf6614ed23ab72f7297da838c6aa51c1ea1c0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.1/javdb-cli_0.6.1_linux_arm64.tar.gz"
      sha256 "b63b972a5cf9e584716b2582d3134731e0430d3d7ed3d1bcfd389127b815d756"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.6.1/javdb-cli_0.6.1_linux_amd64.tar.gz"
      sha256 "74333e4d6550336c5fd1d3ba0852a2219a57a8289c6bdd3084aa109a194cdd1c"
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
