1. Install Xcode Command Line Tools:
    ```bash
    xcode-select --install
    ```

2. **Set Up SSH**: Follow the instructions on [GitHub's SSH setup guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) to configure your SSH keys for secure communication with Git repositories.

3. Clone the Dotfiles Repository:
    ```bash
    git clone git@github.com:DanJecu/dotfiles.git ~/.dotfiles
    ```

4. Run the Homebrew Installation Script:
    ```bash
    chmod +x ~/.dotfiles/scripts/install_brews.sh && ~/.dotfiles/scripts/install_brews.sh
    ```

5. Run the Dotfiles Synchronization Script:
    ```bash
    chmod +x ~/.dotfiles/scripts/sync_dotfiles.sh && ~/.dotfiles/scripts/sync_dotfiles.sh
    ```
