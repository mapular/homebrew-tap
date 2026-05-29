# To update after a release:
# 1. Update version above
# 2. Update sha256 with: shasum -a 256 dist/mapular-X.Y.Z.tar.gz
# 3. Push to github.com/mapular/homebrew-mapular
class Mapular < Formula
  desc "CLI for Mapular — AI-powered location intelligence platform"
  homepage "https://mapular.com"
  version "1.0.0"

  # No source download needed — shim delegates to uvx at runtime
  url "https://github.com/mapular/mapular-platform/releases/download/mapular-v#{version}/mapular-#{version}.tar.gz"
  sha256 "a7f77647df2584627c67bd8a4cfee8852bfb0061dce0273a06f796bd23e64cb9"

  depends_on "uv"

  def install
    (bin/"mapular").write <<~SH
      #!/bin/sh
      exec uvx --from "mapular==#{version}" mapular "$@"
    SH
    (bin/"mapular-admin-mcp").write <<~SH
      #!/bin/sh
      exec uvx --from "mapular==#{version}" mapular-admin-mcp "$@"
    SH
    chmod 0755, bin/"mapular"
    chmod 0755, bin/"mapular-admin-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mapular --version")
  end
end
