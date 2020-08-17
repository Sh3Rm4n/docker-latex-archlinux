# An Arch Linux based docker container with latex and pandoc support
FROM greyltc/archlinux-aur
MAINTAINER Fabian Viöl <f.vioel@gmail.com>

# Update Arch Linux
# Refresh data-base and update archlinux-keyring
RUN su docker -c 'yay -Sy --noprogressbar --needed --noconfirm archlinux-keyring \
    `# Update outdated packages including aur ones (at this point only yay)` \
    && yay -Su --noprogressbar --needed --noconfirm --removemake --cleanafter \
    `# Install latex packages` \
    && yay -S --noprogressbar --needed --noconfirm --removemake --cleanafter \
        texlive-most \
        ghostscript \
        pygmentize \
        biber \
        texlive-latexindent-meta \
    `# Install pandoc packages` \
    && yay -S --noprogressbar --needed --noconfirm \
        pandoc \
        pandoc-crossref \
        pandoc-citeproc \
    `# Install extras` \
    && yay -S --noprogressbar --needed --noconfirm \
        textidote-bin \
        git-latexdiff \
        bc \
    `# Remove unneeded dependencies` \
    && yay -Yc --noprogressbar --noconfirm'
