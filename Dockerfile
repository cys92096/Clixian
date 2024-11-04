FROM archlinux:base
RUN useradd -m -u 1000 user
RUN pacman -Syy --noconfirm && pacman -S --noconfirm --needed aria2
USER user
COPY --chown=user ./install.sh /home/user/install.sh
RUN chmod +x /home/user/install.sh
EXPOSE 5244
CMD ["/home/user/install.sh"]
