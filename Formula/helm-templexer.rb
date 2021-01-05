class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/v0.2.2.tar.gz"
  sha256 "1dbfb7039bfb0e789e03205550964569de398a1b33e3a283c9512dd0ce128f67"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  head do
    url "https://github.com/hendrikmaus/helm-templexer.git"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "helm-templexer", shell_output("#{bin} help")
  end
end
