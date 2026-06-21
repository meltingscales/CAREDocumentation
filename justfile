
# Build all *.md files into a single PDF
compile-docs:
    pandoc README.md PASSWORDS.md IMPORTANT-LOCATIONS.md READING-SYSTEMD-LOGS.md \
        -o CAREDocumentation.pdf \
        --pdf-engine=pdflatex \
        -V geometry:margin=1in \
        --toc \
        --toc-depth=2 \
        -M title="CARE Documentation" \
        -M date="$(date +%Y-%m-%d)"

# Install required dependencies (CachyOS / Arch)
install-deps-cachyos:
    sudo pacman -S --needed pandoc texlive-basic texlive-fontsrecommended
