class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/refs/tags/0.2.7.tar.gz"
  sha256 "50407bc373f5a6193a7418c6772115769bce4ce15ebe58cc20ba5c9e91b73051"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-0.2.7_1"
    sha256 cellar: :any_skip_relocation, catalina:     "3025ef75d1a62f7f89b63d1ba3e7b605f933c2052cc4a68af73facb8bcfc902f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "20c76f5f515ba6e8f85c02a4ba717fcb4bd6acaaedad4d16948b7639658b5745"
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
