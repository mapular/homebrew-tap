# To update after a release:
# 1. Update version
# 2. Update url to new PyPI tarball URL
# 3. Update sha256 with: curl -sL <url> | shasum -a 256
class Mapular < Formula
  desc "CLI for Mapular — AI-powered location intelligence platform"
  homepage "https://mapular.com"
  version "1.0.0"

  url "https://files.pythonhosted.org/packages/source/m/mapular/mapular-1.0.0.tar.gz"
  sha256 "a7f77647df2584627c67bd8a4cfee8852bfb0061dce0273a06f796bd23e64cb9"

  depends_on "uv"

  def install
    (bin/"mapular").write <<~SH
      #!/bin/sh
      exec uvx --from "mapular==#{version}" mapular "$@"
    SH
    (bin/"mapular-admin-mcp").write <<~SH
      #!/bin/sh
      exec uvx --from "mapular-admin-mcp==1.0.0" mapular-admin-mcp "$@"
    SH
    (bin/"mapular-mpoi-mcp").write <<~SH
      #!/bin/sh
      exec uvx --from "mapular-mpoi-mcp==0.2.0" mapular-mpoi-mcp "$@"
    SH
    chmod 0755, bin/"mapular"
    chmod 0755, bin/"mapular-admin-mcp"
    chmod 0755, bin/"mapular-mpoi-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mapular --version")
  end
end
