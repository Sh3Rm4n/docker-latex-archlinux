# An Arch Linux based docker container with latex and pandoc support
FROM greyltc/archlinux-aur
MAINTAINER Fabian Viöl <f.vioel@gmail.com>

# Update Arch Linux
# Refresh data-base and update archlinux-keyring
RUN su docker -c 'yay -Sy --noprogressbar --needed --noconfirm archlinux-keyring'
# Update outdated packages including aur ones (at this point only yay)
RUN su docker -c 'yay -Su --noprogressbar --needed --noconfirm --removemake --cleanafter'

# Install latex packages
RUN su docker -c 'yay -S --noprogressbar --needed --noconfirm --removemake --cleanafter \
    texlive-most \
    pygmentize \
    biber \
    texlive-latexindent-meta'

# Install pandoc packages
RUN su docker -c 'yay -S --noprogressbar --needed --noconfirm \
    pandoc \
    pandoc-crossref \
    pandoc-citeproc'

# Install extras
RUN su docker -c 'yay -S --noprogressbar --needed --noconfirm \
    textidote-bin \
    git-latexdiff'


# Remove unneeded dependencies
RUN su docker -c 'yay -Yc --noprogressbar --noconfirm'
