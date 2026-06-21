
# Build all *.md files into a single PDF
compile-docs:
    pandoc README.md PASSWORDS.md IMPORTANT-LOCATIONS.md READING-SYSTEMD-LOGS.md \
        CARE-RABIES-STATS.md CARE-CAT-STATUS.md MEOWDERALL.md \
        CARE-SHELTER-DONATION-AGGREGATION.md CARE-THERMOMETER.md \
        -o CAREDocumentation.pdf \
        --pdf-engine=pdflatex \
        -V geometry:margin=1in \
        --toc \
        --toc-depth=2 \
        -M title="CARE Documentation" \
        -M date="$(date +%Y-%m-%d)"

# Build the local sites quick-reference PDF
compile-local-guide:
    pandoc LOCAL-SITES-GUIDE.md \
        -o LOCAL-SITES-GUIDE.pdf \
        --pdf-engine=pdflatex \
        -V geometry:margin=1in \
        -M title="CARE Local Sites Guide" \
        -M date="$(date +%Y-%m-%d)"

# Install required dependencies (CachyOS / Arch)
install-deps-cachyos:
    sudo pacman -S --needed pandoc texlive-basic texlive-fontsrecommended
