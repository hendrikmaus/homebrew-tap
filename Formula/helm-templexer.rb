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

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-0.2.2_1"
    cellar :any_skip_relocation
    sha256 "8add6f02dc559df19e8101a1a672326c6dd47803f19a08bfc09e00d21fe1bfd5" => :catalina
    sha256 "e116aeb4daac888779bef95026d8cfd4ca13261d222dfd7a71805a158844cd6e" => :x86_64_linux
  end

  head do
    url "https://github.com/hendrikmaus/helm-templexer.git"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "helm-templexer", shell_output("#{bin}/helm-templexer help")
  end
end
